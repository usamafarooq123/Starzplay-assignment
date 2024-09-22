//
//  Service.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation

public protocol Service {
    func request<T: Decodable> (route: NetworkURLRequestConvertible,
                                _ completion: @escaping (Result<T, NetworkErrors>) -> Void )
}
