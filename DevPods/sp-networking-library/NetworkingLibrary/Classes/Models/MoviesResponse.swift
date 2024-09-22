//
//  MoviesResponse.swift
//  Alamofire
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation

public struct MoviesResponse {
    public let id: Int
    public let imagePath: URL
    
}

public extension MoviesResponse {
    static func mock() -> Self {
        return MoviesResponse(id: 1, imagePath: URL(string: "https://example.com/image.jpg")!)
    }
}
