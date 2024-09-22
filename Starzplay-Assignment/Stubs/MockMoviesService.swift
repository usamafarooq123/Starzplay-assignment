//
//  MockMoviesService.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 22/09/2024.
//

import Foundation
import NetworkingLibrary

class MockMovieService: MovieServiceType {
    
    var moviesResult: Result<[MoviesResponse], NetworkErrors>?
    var seasonResult: Result<SeasonDetailResponse, NetworkErrors>?
    var episodesResult: Result<[EpisodesResponse], NetworkErrors>?
    
    
    func fetchMoviesList(_ completion: @escaping (Result<[MoviesResponse], NetworkErrors>) -> Void) {
        if let moviesResult = moviesResult {
            completion(moviesResult)
        }
    }
    
    func fetchSeasonDetails(_ completion: @escaping (Result<SeasonDetailResponse, NetworkErrors>) -> Void) {
        if let seasonResult = seasonResult {
            completion(seasonResult)
        }
    }
    
    func fetchEpisodeDetails(seriesId: Int, seasonNumber: Int, _ completion: @escaping (Result<[EpisodesResponse], NetworkErrors>) -> Void) {
        if let episodesResult = episodesResult {
            completion(episodesResult)
        }
    }
    
    
}
