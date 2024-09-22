//
//  APIResponseConvertible.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation

public protocol APIResponseConvertible: Codable {
    var code: Int { get }
    var data: Data { get }
}
