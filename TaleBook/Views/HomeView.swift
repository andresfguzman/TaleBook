//
//  HomeView.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 31/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

protocol HomeView: class {
    func updatePostList()
    func showErrorMessage(with error: String)
    func stopPullToRefresh()
}
