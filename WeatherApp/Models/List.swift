//
//  List.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import Foundation

struct WeatherList: Decodable, Identifiable {
    let id = UUID()
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let date: Date

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop
        case dtTxt = "dt_txt"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dt = try container.decode(Int.self, forKey: .dt)
        main = try container.decode(Main.self, forKey: .main)
        weather = try container.decode([Weather].self, forKey: .weather)
        clouds = try container.decode(Clouds.self, forKey: .clouds)
        wind = try container.decode(Wind.self, forKey: .wind)
        visibility = try container.decode(Int.self, forKey: .visibility)
        pop = try container.decode(Double.self, forKey: .pop)

        let dtTxtString = try container.decode(String.self, forKey: .dtTxt)

        self.date = Date.dateFromStrings(dtTxtString)
    }
    init() {
        self.dt = 01
        self.main = Main.mock()
        self.weather = []
        self.clouds = Clouds.mock()
        self.wind = Wind.mock()
        self.visibility = 0
        self.pop = 0
        self.date = Date()
    }
}
