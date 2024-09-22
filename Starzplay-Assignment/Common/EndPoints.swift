//
//  EndPoints.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 22/09/2024.
//

import Foundation

enum MoviesEndPoints {
    case fetchEpisodeDetails
    
    var path: String {
        switch self {
        case .fetchEpisodeDetails:
            return "%d/season/%d"
        }
    }
}
