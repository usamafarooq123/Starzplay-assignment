//
//  SeasonDetailsHeaderCellModel.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 22/09/2024.
//

import Foundation

struct SeasonDetailsHeaderCellModel: CellIdentifierType {
    var cellIdentifier: CellIdentifier = .headerCell
    let bannerImage: URL
    let seasonName: String
    let seasonDetails: String
    let seasonDescription: String
}
