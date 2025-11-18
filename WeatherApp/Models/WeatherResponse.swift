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
    let list: [List]
    let city: City
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
}

enum Icon: String, Codable {
    case the01D = "01d"
    case the01N = "01n"
    case the02N = "02n"
    case the03D = "03d"
    case the04D = "04d"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
}
