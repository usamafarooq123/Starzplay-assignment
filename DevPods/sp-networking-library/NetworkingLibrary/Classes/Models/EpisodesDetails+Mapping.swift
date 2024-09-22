//
//  EpisodesDetails.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation

public struct EpisodesDetailsDTO: Codable {
    let id, airDate: String?
    let episodes: [Episode]
    let name, overview: String?
    let welcomeID: Int?
    let posterPath: String?
    let seasonNumber: Int?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case airDate = "air_date"
        case episodes, name, overview
        case welcomeID = "id"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case voteAverage = "vote_average"
    }
}

// MARK: - Episode
struct Episode: Codable {
    let airDate: String?
    let episodeNumber: Int?
    let id: Int?
    let name, overview, productionCode: String?
    let runtime, seasonNumber, showID: Int?
    let stillPath: String?
    
    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case id, name, overview
        case productionCode = "production_code"
        case runtime
        case seasonNumber = "season_number"
        case showID = "show_id"
        case stillPath = "still_path"
    }
}


public extension EpisodesDetailsDTO {
    func toDomain() ->  [EpisodesResponse] {
        return episodes.map( { .init(thumbnail: URL(string: Constants.posterPath + ($0.stillPath ?? ""))! , episodeTitle: "EP \($0.episodeNumber ?? 0) - \($0.name ?? "")") } )
    }
    
}
