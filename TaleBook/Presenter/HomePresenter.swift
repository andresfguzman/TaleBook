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
    weak var view: HomeView!
    
    func loadPosts() {
        view.showLoadingView()
        let useCase = GetPostsImpl(service: GetPostsService())
        useCase.execute(forPage: currentPage, success: { [weak self] (posts) in
            self?.view.hideLoadingView()
            self?.posts.append(contentsOf: posts)
            self?.view.updatePostList()
        }) { [weak self] (errorString) in
            self?.view.hideLoadingView()
            self?.view.showErrorMessage(with: errorString)
        }
    }
}