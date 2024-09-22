//
//  NetworkClientDelegate.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation

public protocol NetworkClientDelegate {
    func request<T: Decodable, E: Decodable>( requestContainer: RequestContainer<E>, _ completion: @escaping (Result<T, NetworkErrors>) -> Void)
}

