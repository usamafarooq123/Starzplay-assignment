//
//  NetworkErrorHandler.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation


class NetworkErrorHandler {
    public static func decode<T: Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    static func mapError(_ code: Int, data: Data) -> NetworkErrors {
        
        switch code {
        case 400...499:
            let serverError: InternalServerError? = try? decode(data: data)
            return .InternalServerError(serverError)
        case -1001:
            return .noInternet
        default:
            return .unknown
        }
    }
}
