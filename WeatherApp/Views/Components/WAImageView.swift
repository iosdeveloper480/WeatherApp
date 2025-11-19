//
//  WAImageView.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/19/25.
//

import SwiftUI

struct WAImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                
            case .failure(_):
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFill()
                
            @unknown default:
                ProgressView()
            }
        }
        .frame(width: 100, height: 100)
    }
}

#Preview {
    WAImageView(url: URL(string: "https://openweathermap.org/img/wn/01n@2x.png"))
}
