//
//  SeasonDetailResponse.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation


public struct SeasonDetailResponse {
    public let posterPath: URL
    public let name: String
    public let detail: String
    public let description: String
    public let season: [SeasonResponse]
}

public struct SeasonResponse {
    public let id: Int
    public let name: String
}

public extension SeasonResponse {
   static func mock() -> Self {
        .init(id: 0, name: "")
    }
}

public extension SeasonDetailResponse {
    static func mock() -> Self {
        return SeasonDetailResponse(posterPath: URL(string: "https://example.com/poster.jpg")!,
                                    name: "Mock Season Name",
                                    detail: "Mock Season Details",
                                    description: "Mock Season Description",
                                    season: [SeasonResponse.mock()])
    }
}
