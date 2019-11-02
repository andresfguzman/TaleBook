//
//  Service.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}

protocol Service {
    var baseURL: URL { get }
    func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, APIServiceError>) -> Void)
}

extension Service {
    var baseURL: URL {
        return URL(string: TBConstants.shared.baseServiceURL)!
    }
}
