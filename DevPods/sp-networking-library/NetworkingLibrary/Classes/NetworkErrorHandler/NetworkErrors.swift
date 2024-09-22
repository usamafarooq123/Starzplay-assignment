//
//  NetworkErrorHandler.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation

public struct ServerError: Codable {
    public let code: String
    public let message: String
    public let description: String?
}

public struct InternalServerError: Codable {
    public let errorInfo: ServerError?
    public let errorDescription: String?
}

public enum NetworkErrors: LocalizedError {
    case noInternet
    case InternalServerError(InternalServerError?)
    case decoding(Error)
    case unknown
}

extension NetworkErrors {
    public var errorDescription: String? {
        switch self {
        case .noInternet:
            return "Look's like your are offline. Please reconnect and refresh to continue using app."
        case .InternalServerError(let internalServerError):
            if let serverError = internalServerError?.errorInfo {
                if let errorInfo = serverError.description {
                    return serverError.message + "\n" + errorInfo
                }
                return serverError.message
            }
            
            if let msg = internalServerError?.errorDescription {
                return msg
            }
            
            return "Sorry, that doesn't look right."
        case .decoding(let error):
            return "Mapping failed: " + error.localizedDescription
        case .unknown:
            return "Something went wrong" 
        }
    }
}
