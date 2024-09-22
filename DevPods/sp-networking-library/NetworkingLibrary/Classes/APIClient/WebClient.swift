//
//  WebClient.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation
import Alamofire


public typealias WebClientConfigurable = BaseUrlProvider

public class WebClient: APIClient {
    
    private var session: Alamofire.Session
    
    public init() {
        self.session = Alamofire.Session(configuration: URLSessionConfiguration.default)
    }
    
    public func request(router: NetworkURLRequestConvertible, _ completion: @escaping (APIResponseConvertible?, NetworkErrors?) -> Void) {
        
        let urlRequest = router.urlRequest
               var requestUrl = ""
               if let url = urlRequest?.url?.absoluteString {
                   requestUrl = url + " -> " + (String(data: urlRequest?.httpBody ?? Data(), encoding: .utf8) ?? "Failed to Convert")
                   #if DEBUG
                   print("Initiating request: \(requestUrl)")
                   print("HEADERS")
                   urlRequest?.allHTTPHeaderFields?.forEach { print("\($0.key) : \($0.value)") }
                   #endif
               }
               
               session.request(router).validate().responseData(completionHandler: {  response in
                   response.data.map { String(data: $0, encoding: .utf8 ).map { print("Response for : \(requestUrl)" + "\n" + $0) } }
                   if response.error != nil {
                       let code = response.response?.statusCode ?? ((response.error!) as NSError).code
                       let errorData = response.data ?? Data()
                       let apiResponse = APIResponse(code: code, data: errorData)
                       completion(apiResponse,nil)
                   } else {
                       let code = response.response?.statusCode ?? 200
                       let data = response.data ?? Data()
                       let apiResponse = APIResponse(code: code, data: data)
                       completion(apiResponse, nil)
                   }
               })
        
    }
}
