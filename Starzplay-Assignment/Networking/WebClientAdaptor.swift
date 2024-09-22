//
//  WebClientAdaptor.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation
import NetworkingLibrary

final class WebClientAdaptor {
    
    var configurations: WebClientConfigurable
    var dataTransferService: Service
    
    init(configurations: WebClientConfigurable, dataTransferService: Service) {
        self.configurations = configurations
        self.dataTransferService = dataTransferService
    }
}


extension WebClientAdaptor: NetworkClientDelegate {
    func request<T: Decodable, E: Codable>(requestContainer: RequestContainer<E>, _ completion: @escaping  (Result<T, NetworkErrors>) -> Void ) {
            
            let route = APIEndpoint(requestContainer.httpMethod.httpMethod, configurations.baseURL, requestContainer.path, pathVariables: requestContainer.requestInput.pathVariables, query: requestContainer.requestInput.query, body: requestContainer.requestInput.body, headers: requestContainer.requestInput.headers ?? [:])
            
            dataTransferService.request(route: route, { (result: Result<T, NetworkErrors>) -> Void in
                switch result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                    print(error.localizedDescription)
//                        completion(.failure(NetworkErrors(errorString: error.errorDescription ?? "Something went wrong")))
                }
            })
        }
    
    
}
