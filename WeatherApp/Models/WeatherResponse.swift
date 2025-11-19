//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import Foundation

struct WeatherResponse: Decodable {
    let cod: String
    let message, cnt: Int
    let list: [WeatherList]
    let city: City
}
