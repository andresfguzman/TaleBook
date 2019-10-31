//
//  GetPostsService.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

final class GetPostsService: Service {
    
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "https://storage.googleapis.com/cdn-og-test-api/test-task/social/")!
    private let jsonDecoder = JSONDecoder()
    
    init() {}
    
    private func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: url) { (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(.decodeError))
                }
            case .failure( _):
                completion(.failure(.apiError))
            }
            }.resume()
    }
}

extension GetPostsService {
    public func fetchPosts(from page: Int, result: @escaping (Result<[SocialMediaPost], APIServiceError>) -> Void) {
        let postsURL = baseURL
            .appendingPathComponent(String(format: "%d.json", page))
        fetchResources(url: postsURL, completion: result)
    }
}
