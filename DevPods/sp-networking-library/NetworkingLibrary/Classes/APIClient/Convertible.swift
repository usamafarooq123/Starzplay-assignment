//
//  Convertible.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation

public typealias RouterInput<T: Codable> = (body: T?, query: [String: String]?, pathVariables: [String]?, headers: [String: String]?)

public enum RequestType: Int {
    case json
}

public extension RequestType {
    var requestHeader: [String: String] {
        var headers = [String: String]()
        switch self {
        case .json:
//            headers["Content-Type"] = "application/json"
            headers["Accept"] = "application/json"
        }
        return headers
    }
}

public protocol Convertible {
    func urlRequest<T: Codable>(with url: URL, path: String, method: NetworkHTTPMethod, requestType: RequestType, input: RouterInput<T>?, authManager: AuthenticationManager? ) throws -> URLRequest
    var customHeaders: [String: String] { get }
}

public extension Convertible {
       
    func urlRequest<T: Codable>(with url: URL, path: String, method: NetworkHTTPMethod, requestType: RequestType, input: RouterInput<T>?, authManager: AuthenticationManager? ) throws -> URLRequest {
        let url = try constructApiUrl(with: url, path: path, input: input)
        var urlRequest = URLRequest(url: url)
        
        
        urlRequest.httpMethod = method.rawValue
        
        let requestTypeHeaders = requestType.requestHeader
        
        for (key, value) in requestTypeHeaders {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        for (key, value) in customHeaders {
            urlRequest.setValue(value, forHTTPHeaderField: key)
            #if DEBUG
            debugPrint("\(key) :: \(value)")
            #endif
        }
        
        if let auth = authManager?.bearerToken {
            for (key, value) in authManager?.bearerToken ?? [:] {
                urlRequest.setValue(value, forHTTPHeaderField: key)
                #if DEBUG
                debugPrint("\(key) :: \(value)")
                #endif
            }
        }
        
        if let parameters = input?.body {
            urlRequest.httpBody = Data()
            do {
                let encoder = JSONEncoder()
                encoder.dateEncodingStrategy = .millisecondsSince1970
                urlRequest.httpBody = try encoder.encode(parameters)
            } catch {
                throw error
            }
        }
        
        return urlRequest
    }
    
    private func constructApiUrl<T: Codable>(with url: URL, path: String, input: RouterInput<T>?) throws -> URL {
        guard let `input` = input else { return url.appendingPathComponent(path) }
        var constructedURL = url.appendingPathComponent(path)
        
        if let pathVariables = input.pathVariables {
            for pathVariable in pathVariables {
                constructedURL.appendingPathComponent(pathVariable)
            }
        }
        
        if let query = input.query {
            var components = URLComponents(string: constructedURL.absoluteString)!
            var queryItems = [URLQueryItem]()
            
            for (key, value) in query {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
            components.queryItems = queryItems
            return components.url!
        }
        return constructedURL
        
    }
}
