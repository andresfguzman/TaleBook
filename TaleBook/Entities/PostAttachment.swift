//
//  PostAttachment.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

struct PostAttachment: Codable {
    let pictureLink: URL?
    let width: Double?
    let height: Double?
    
    enum CodingKeys: String, CodingKey {
        case pictureLink = "picture-link"
        case width
        case height
    }
}
