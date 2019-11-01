//
//  Author.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

struct Author: Codable {
    let account: String?
    let isVerified: Bool
    let name: String
    let pictureLink: URL
    
    enum CodingKeys: String, CodingKey {
        case account
        case isVerified = "is-verified"
        case name
        case pictureLink = "picture-link"
    }
}
