//
//  APIResponse.swift
//  NetworkingLibrary
//
//  Created by usama farooq on 20/09/2024.
//

import Foundation

struct APIResponse: APIResponseConvertible {
    var code: Int
    var data: Data

    public init(code: Int, data: Data) {
        self.code = code
        self.data = data
    }
    
}
