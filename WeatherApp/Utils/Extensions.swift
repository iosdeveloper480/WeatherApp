//
//  Extensions.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import Foundation

extension Date {
    static func dateFromStrings(_ stringDate:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: stringDate)
        return date!
    }
}
