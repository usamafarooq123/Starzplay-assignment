//
//  AppConfiguration.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation

public struct AppConfiguration {
    private(set) var baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
}


