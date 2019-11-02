//
//  GetPostsImpl.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

class GetPostsImpl: UseCaseImpl, GetPosts {
    
    var service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func execute(forPage page: Int, success: @escaping GetPostsClosure, failure: @escaping (String) -> Void) {
        (service as! GetPostsService).fetchPosts(from: page) { (result) in
            switch result {
            case .success(let socialMediaPost):
                success(socialMediaPost)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
