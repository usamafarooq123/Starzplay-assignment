//  
//  MoviesDetailsBuilder.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation
import UIKit

class MoviesDetailsBuilder {

    func build(with navigationController: UINavigationController?, service: MovieServiceType) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "MoviesDetails", bundle: Bundle(for: MoviesDetailsBuilder.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: "MoviesDetailsViewController") as! MoviesDetailsViewController
        let coordinator = MoviesDetailsRouter(navigationController: navigationController)
        let viewModel = MoviesDetailsViewModelImpl(router: coordinator, service: service)

        viewController.viewModel = viewModel
        
        return viewController
    }
}


