//
//  DateFormatter+TBStringFormatted.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 1/11/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import Foundation

extension DateFormatter {
    func getFormattedTBDate(with stringDate: String) -> String {
//        let dateFormatter = DateFormatter()
        let date = ISO8601DateFormatter().date(from:stringDate)!
        self.dateFormat = TBConstants.shared.cellDateFormatString
        self.locale = Locale.current
        self.timeZone = TimeZone.current
        return self.string(from: date)
    }
}
