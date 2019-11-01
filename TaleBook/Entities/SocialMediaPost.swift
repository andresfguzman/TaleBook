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
    let date: String
    let author: Author
    let text: PostText?
    let attachment: PostAttachment?
}

extension SocialMediaPost {
    func getFormattedDate() -> String{
        
        let dateFormatter = DateFormatter()
        let date = ISO8601DateFormatter().date(from:self.date)!
        dateFormatter.dateFormat = TBConstants.shared.cellDateFormatString
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        return "\(dateFormatter.string(from: date))"
    }
}
