//
//  AuthenticationManager.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation

public final class AuthenticationManager {
    private var authToken: String? = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZmQyODc0ODdkMGE4MTk3ZjMwMjMyZDQ5ZDBkMjU4YyIsIm5iZiI6MTcyNjg0MTUyNy44NTg4NjQsInN1YiI6IjY2ZWJjY2NlNTE2OGE4OTZlMTFmZDdlMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qdHnHLwtLFjVOGR8vqGAXJk1AciU3UfCJn5no5Uw-Ro"
    
    init() {}
    
    public var bearerToken: [String: String] {
        guard let token = authToken else { return [:] }
        return ["Authorization": "Bearer \(token)"]
    }
    
    fileprivate func setToken(authToken: String) {
        self.authToken = authToken
    }
    
    fileprivate func clearToken() {
        self.authToken = nil
    }
}


