//
//  HomePresenter.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

final class HomePresenter {
    
    static let shared = HomePresenter()
    var posts: [SocialMediaPost] = []
    var currentPage = 1
    
    func loadPosts() {
        let useCase = GetPostsImpl(service: GetPostsService())
        useCase.execute(forPage: currentPage, success: { [weak self] (posts) in
            self?.posts = posts
        }) { (errorString) in
            print(errorString)
        }
    }
}
