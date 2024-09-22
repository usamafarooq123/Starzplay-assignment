//
//  RequestContainer.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation

public enum HTTPMethodTypes: String {
    case get = "GET"
    case post = "POST"
}

public extension HTTPMethodTypes {
    var httpMethod: NetworkHTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        }
    }
}

public struct RequestContainer<T: Codable> {
    
    public private(set) var path: String
    public private(set) var httpMethod: HTTPMethodTypes
    public private(set) var requestInput: RouterInput<T>
    
   public init(path: String, httpMethod: HTTPMethodTypes, requestInput: RouterInput<T>) {
        self.path = path
        self.httpMethod = httpMethod
        self.requestInput = requestInput
    }
    
}
