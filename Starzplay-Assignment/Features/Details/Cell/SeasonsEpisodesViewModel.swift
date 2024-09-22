//
//  SeasonsEpisodesViewModel.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation
import NetworkingLibrary

typealias SeasonsEpisodesViewModelOutput = (SeasonsEpisodesViewModel.Output) -> Void

class SeasonsEpisodesViewModel: CellIdentifierType {
    
    var cellIdentifier: CellIdentifier = .bodyCell
    private let seasons: [SeasonResponse]
    private var episodes: [EpisodesResponse] = []
    private var selectedSeason: SeasonResponse
    
    let service: MovieServiceType
    var output: SeasonsEpisodesViewModelOutput?
    
    init(seasons: [SeasonResponse], service: MovieServiceType) {
        self.seasons = seasons
        self.service = service
        self.selectedSeason = seasons.first ?? .mock()
    }
    
    func itemSeasonCell(row: Int) -> (SeasonResponse, Bool) {
        let item = seasons[row]
        return (item, item.id == selectedSeason.id)
    }
    
    func itemEpisodeCell(row: Int) -> EpisodesResponse {
        return episodes[row]
    }
    
    
    enum Output {
        case reload
        case reloadCollectionView
    }
    
    func fetchEpisodes() {
        service.fetchEpisodeDetails(seriesId: 62852, seasonNumber: selectedSeason.id, { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let episodes):
                self.episodes = episodes
                output?(.reload)
                
            case .failure(let failure):
                print(failure)
            }
        })
    }
    
    func seasonsCount() -> Int {
        return seasons.count
    }
    
    func episodesCount() -> Int {
        return episodes.count
    }
    
    func selectSeason(at index: Int) {
        selectedSeason = seasons[index]
        output?(.reloadCollectionView)
        fetchEpisodes()
        
    }
}

