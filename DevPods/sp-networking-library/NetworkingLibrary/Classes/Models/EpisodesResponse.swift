//
//  EpisodesResponse.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation


public struct EpisodesResponse {
    public let thumbnail: URL
    public let episodeTitle: String
}

public extension EpisodesResponse {
    static func mock() -> Self {
        return EpisodesResponse(thumbnail: URL(string: "https://example.com/thumbnail.jpg")!,
                                episodeTitle: "Mock Episode Title")
    }
}
