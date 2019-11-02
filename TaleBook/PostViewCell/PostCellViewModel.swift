//
//  PostCellViewModel.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 1/11/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

struct PostCellViewModel {
    let network: SocialNetwork
    let link: URL
    let date: String
    let authorName: String
    let authorAccount: String
    let authorProfilePic: URL
    let verifiedAccount: Bool
    let text: String?
    let postPicture: URL?
    
    init(with post: SocialMediaPost) {
        network = SocialNetwork(rawValue: post.network) ?? .twitter
        link = post.link
        let dateFormatter = DateFormatter()
        date = dateFormatter.getFormattedTBDate(with: post.date)
        authorName = post.author.name
        authorAccount = "@\(post.author.account ?? "")"
        authorProfilePic = post.author.pictureLink
        verifiedAccount = post.author.isVerified
        text = post.text?.plain
        postPicture = post.attachment?.pictureLink
    }
}
