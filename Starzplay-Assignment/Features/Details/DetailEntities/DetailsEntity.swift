//
//  DetailsEntity.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 22/09/2024.
//

import Foundation

protocol CellConfigureType {
    func configureCell(with data: CellIdentifierType, delegate: playVideoDelegate)
}

enum CellIdentifier: Int {
    case headerCell = 0
    case bodyCell
    var identifier: String {
        switch self {
        case .headerCell:
            return "SeasonDetailsHeaderCell"
        case .bodyCell:
            return "SeasonsEpisodesCell"
        }
    }
}

protocol CellIdentifierType {
    var cellIdentifier: CellIdentifier { get }
}
