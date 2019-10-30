//
//  SocialMediaPost.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

struct SocialMediaPost: Codable {
    let network: String
    let link: URL
    let date: Date
    let author: Author
    let text: PostText
    let attachment: PostAttachment
}
