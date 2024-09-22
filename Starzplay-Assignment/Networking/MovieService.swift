//
//  MovieUseCase.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation
import NetworkingLibrary

protocol MovieServiceType {
    func fetchSeasonDetails(_ completion: @escaping (Result<SeasonDetailResponse, NetworkErrors>) -> Void  )
    func fetchEpisodeDetails(seriesId: Int, seasonNumber: Int,  _ completion: @escaping (Result<[EpisodesResponse], NetworkErrors>) -> Void )
}

class MovieService: MovieServiceType {
    
    var client: NetworkClientDelegate
    
    init(client: NetworkClientDelegate) {
        self.client = client
    }
    
    func fetchSeasonDetails( _ completion: @escaping (Result<SeasonDetailResponse, NetworkErrors>) -> Void) {
        let params = ["language": "en-US"]
        let routerInput: RouterInput<String> = (nil, params, nil, nil)
        
        let requestContainer: RequestContainer<String> = RequestContainer(path: "62852", httpMethod: .get, requestInput: routerInput)
        client.request(requestContainer: requestContainer) { (result: Result<SeasonDetailsDTO, NetworkErrors>) -> Void  in
            switch result {
            case .success(let success):
                completion(.success(success.toDomain()))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func fetchEpisodeDetails( seriesId: Int, seasonNumber: Int,  _ completion: @escaping (Result<[EpisodesResponse], NetworkErrors>) -> Void) {
        
        
        let params = ["language": "en-US"]
        let routerInput: RouterInput<String> = (nil, params, nil, nil)

        let path = String(format: MoviesEndPoints.fetchEpisodeDetails.path, seriesId, seasonNumber)
        
        let requestContainer: RequestContainer<String> = RequestContainer(path: path, httpMethod: .get, requestInput: routerInput)
        
        client.request(requestContainer: requestContainer) { (result: Result<EpisodesDetailsDTO, NetworkErrors>) -> Void  in
            switch result {
            case .success(let success):
                completion(.success(success.toDomain()))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
        
    }
    
    
}
