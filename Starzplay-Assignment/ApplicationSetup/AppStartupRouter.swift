//
//  AppStartup.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import Foundation
import UIKit
import NetworkingLibrary

final class AppStartupRouter {
    
    private var appConfigs = AppConfiguration(baseURL: Constants.DevelopmentServer.baseURL)
    
   lazy var webClient: NetworkClientDelegate = {
        let configuration = APIConfiguration(baseURL: appConfigs.baseURL)
        let adaptor = WebClientAdaptor(configurations: configuration, dataTransferService: BaseService(config: configuration, apiClient: WebClient()))
        return adaptor
    }()
    
    private lazy var moviesService: MovieServiceType = {
        return MovieService(client: webClient)
    }()
    
    
    func route(into window: UIWindow?) {
        let navigationControlr = UINavigationController()
        navigationControlr.modalPresentationStyle = .fullScreen
        let viewController = MoviesDetailsBuilder()
            .build(with: navigationControlr, service: moviesService)
        viewController.modalPresentationStyle = .fullScreen
        navigationControlr.setViewControllers([viewController], animated: true)
        window?.rootViewController = navigationControlr
        window?.makeKeyAndVisible()
    }
}
