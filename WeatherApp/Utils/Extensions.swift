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
    func dayName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    var isInToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
}
extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
