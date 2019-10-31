//
//  GetPosts.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

typealias GetPostsClosure = ([SocialMediaPost]) -> Void

protocol GetPosts {
    func execute(forPage page: Int, success: @escaping GetPostsClosure, failure: @escaping (String) -> Void)
}
