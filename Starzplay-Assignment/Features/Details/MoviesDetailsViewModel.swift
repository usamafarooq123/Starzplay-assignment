//  
//  MoviesDetailsViewModel.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import NetworkingLibrary


typealias MoviesDetailsViewModelOutput = (MoviesDetailsViewModelImpl.Output) -> Void

protocol MoviesDetailsViewModelInput {
    
}

protocol MoviesDetailsViewModel: MoviesDetailsViewModelInput {
    var output: MoviesDetailsViewModelOutput? { get set}
    
    func viewModelDidLoad()
    func viewModelWillAppear()
    func cellViewModel(forRow row: Int) -> CellIdentifierType
    func numberOfRows() -> Int
}

class MoviesDetailsViewModelImpl: MoviesDetailsViewModel, MoviesDetailsViewModelInput {
    
    private let router: MoviesDetailsRouter?
    var output: MoviesDetailsViewModelOutput?
    private let service: MovieServiceType
    var seasonDetails: SeasonDetailResponse?
    
    init(router: MoviesDetailsRouter? = nil, service: MovieServiceType ) {
        self.router = router
        self.service = service
    }
    
    func viewModelDidLoad() {
        fetchSeasonDetails()
    }
    
    func viewModelWillAppear() {
        
    }
    
    //For all of your viewBindings
    enum Output {
        case reload
    }
    
    func cellViewModel(forRow row: Int) -> CellIdentifierType {
        guard let seasonDetails = seasonDetails else {
                    fatalError("seasonDetails should not be nil")
                }
        let cellIndetifier = CellIdentifier(rawValue: row) ?? .headerCell
        
        switch cellIndetifier {
        case .headerCell:
            return SeasonDetailsHeaderCellModel(bannerImage: seasonDetails.posterPath, seasonName: seasonDetails.name, seasonDetails: seasonDetails.detail, seasonDescription: seasonDetails.description)
        case .bodyCell:
            return SeasonsEpisodesViewModel(seasons: seasonDetails.season, service: service)
        }
    }

    private func fetchSeasonDetails() {
        service.fetchSeasonDetails { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let details):
                self.seasonDetails = details
                self.output?(.reload)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return seasonDetails?.season.isEmpty ?? true ? 0 : 2
    }
}
