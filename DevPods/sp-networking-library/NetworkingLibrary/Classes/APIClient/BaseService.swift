//
//  BaseService.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation


open class BaseService {
    public let config: BaseUrlProvider
    public let apiClient: APIClient
    
   public init(config: BaseUrlProvider, apiClient: APIClient) {
        self.config = config
        self.apiClient = apiClient
    }
    
    private var serverReadableDateTimeFormatter: DateFormatter {
         let formatter = DateFormatter()
         formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss z"
         formatter.locale = Locale(identifier: "en_US_POSIX")
         formatter.timeZone = TimeZone(abbreviation: "GMT")
         return formatter
     }

     private func decode<T: Decodable>(data: Data) throws -> T {
         let decoder = JSONDecoder()
         decoder.dateDecodingStrategy = .formatted(serverReadableDateTimeFormatter)
         return try decoder.decode(T.self, from: data)
     }
}


extension BaseService: Service {
    public func request<T>(route: NetworkURLRequestConvertible, _ completion: @escaping (Result<T, NetworkErrors>) -> Void) where T : Decodable {
        
        apiClient.request(router: route) { response, error in
            guard let response = response, 200...299 ~= (response.code) else {
                completion(.failure(NetworkErrorHandler.mapError(response?.code ?? 0, data: response?.data ?? Data())))
                return
            }
            
            do {
                let object: T = try self.decode(data: response.data)
                completion(.success(object))
            } catch {
                completion(.failure(.decoding(error)))
            }
        }
    }
    
    
}
