//
//  TBConstants.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 1/11/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import UIKit

enum SocialNetwork: String {
    case twitter
    case facebook
    case instagram
    case empty
    
    var stringValue: String {
        switch self {
        case .twitter:
            return "twitter"
        case .facebook:
            return "facebook"
        case .instagram:
            return "instagram"
        case .empty:
            return "placeholder"
        }
    }
}

final class TBConstants {
    
    public static let shared = TBConstants()
    
    private init() { }
    
    let cellSeparatorHeight: CGFloat = 16.0
    let cellRadius: CGFloat = 10.0
    let cellBorderThickness: CGFloat = 1.0
    let baseAppColor = UIColor(red: 139/256, green: 0/256, blue: 139/256, alpha: 1.0)
    let tbGrayColor = UIColor(red: 245/256, green: 245/256, blue: 245/256, alpha: 1.0)
    let cellBorderColor: CGColor = UIColor(red: 139/256, green: 0/256, blue: 139/256, alpha: 0.5).cgColor
    
    let baseServiceURL = "https://storage.googleapis.com/cdn-og-test-api/test-task/social/"
    let cellDateFormatString = "EEEE, d MMMM yyyy"
    let fetchingMessage = "Fetching Data"
    
    let alertTittle = "Something went wrong"
}
