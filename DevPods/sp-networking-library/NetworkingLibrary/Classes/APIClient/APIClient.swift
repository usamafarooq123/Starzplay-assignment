//
//  APIClient.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation
import Alamofire

public typealias NetworkURLRequestConvertible = URLRequestConvertible
public typealias NetworkHTTPMethod = HTTPMethod

public protocol APIClient {
    func request(router: NetworkURLRequestConvertible, _ completion: @escaping (APIResponseConvertible?, NetworkErrors?) -> Void )
}
