//
//  SeasonDetailsDTO+Mapping.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation

public struct SeasonDetailsDTO: Codable {
    let adult: Bool
    let backdropPath: String
    let createdBy: [CreatedBy]
    let episodeRunTime: [Int]
    let seasons: [Season]
    let date: String
    let name: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case seasons
        case date = "last_air_date"
        case name
        case overview
    }
    
}
// MARK: - CreatedBy
struct CreatedBy: Codable {
    let id: Int
    let creditID, name, originalName: String
    let gender: Int
    let profilePath: String

    enum CodingKeys: String, CodingKey {
        case id
        case creditID = "credit_id"
        case name
        case originalName = "original_name"
        case gender
        case profilePath = "profile_path"
    }
}

struct Season: Codable {
    let airDate: String
    let episodeCount, id: Int
    let name, overview, posterPath: String
    let seasonNumber: Int
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id, name, overview
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case voteAverage = "vote_average"
    }
}


public extension SeasonDetailsDTO {
    func toDomain() -> SeasonDetailResponse {
//        return .init(posterPath: URL(string: Constants.posterPath + (backdropPath))!)
        let posterPath = URL(string: Constants.posterPath + (backdropPath))!
        
        let details = date + "| " + "\(seasons.count) " + "Seasons"
        
        return .init(posterPath: posterPath, name: name, detail: details, description: overview, season: seasons.map({ .init(id: $0.seasonNumber, name: $0.name) }))
    }
}
