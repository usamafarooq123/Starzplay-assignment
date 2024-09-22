//
//  APIConfiguration.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation

public protocol BaseUrlProvider {
    var baseURL: URL { get }
}

public struct APIConfiguration: BaseUrlProvider {
    public var baseURL: URL
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
}
