//
//  Weather.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
extension Weather {
    var iconURL: URL? {
        if let url = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png") {
            return url
        }
        return URL(string: "https://openweathermap.org/img/wn/10d@2x.png")
    }
}
