//
//  SocialMediaPost.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

struct SocialMediaPost: Codable {
    let network: String?
    let link: URL?
    let date: Date?
    let author: Author?
    let text: PostText?
    let attachment: PostAttachment?
}

extension SocialMediaPost {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        network = try? container.decode(String.self, forKey: .network)
        link = try? container.decode(URL.self, forKey: .link)
        date = try? container.decode(Date.self, forKey: .date)
        author = try? container.decode(Author.self, forKey: .author)
        text = try? container.decode(PostText.self, forKey: .text)
        attachment = try? container.decode(PostAttachment.self, forKey: .attachment)
    }
}
