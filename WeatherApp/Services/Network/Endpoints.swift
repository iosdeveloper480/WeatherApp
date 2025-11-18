//
//  Endpoints.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//


enum AppMode: Int {
    case test = 0, production
}

var appMode: AppMode {
    return AppMode.production
}

struct EndPoints {
    
    static func urlString(_ service: Service) -> String {
        
        var servicePath = ""
        
        switch (service) {
        case .forecast:
            servicePath = "forecast"
        }
        
        return self.baseUrl + "" + servicePath
    }
    
    static var baseUrl: String {
        var baseUrl = ""
        var tail = ""
        switch appMode {
        case .test:
            baseUrl = "http://localhost:3000"
        case .production:
            baseUrl = BASE_URL
        }
        
        return baseUrl + tail
    }
    
    enum Service {
        case forecast
    }
}
