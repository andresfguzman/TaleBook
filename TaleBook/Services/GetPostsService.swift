//
//  GetPostsService.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

final class GetPostsService: BaseService {
    
    public func fetchPosts(from page: Int, result: @escaping (Result<[SocialMediaPost], APIServiceError>) -> Void) {
        let postsURL = baseURL
            .appendingPathComponent(String(format: "%d.json", page))
        fetchResources(url: postsURL, completion: result)
    }
    
}
