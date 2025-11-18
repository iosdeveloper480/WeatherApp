//
//  Weather.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: MainEnum
    let description: Description
    let icon: Icon
}
