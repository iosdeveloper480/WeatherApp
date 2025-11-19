//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import SwiftUI

struct WeatherCell: View {
    
    let weatherListModel: WeatherList
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(weatherListModel.date.dayName())
                .font(.custom("Poppins-SemiBold", size: 16))
                .lineSpacing(0)
                .frame(height: 24, alignment: .center)
            HStack {
                WAImageView(url: weatherListModel.weather.first!.iconURL)
                Spacer()
                Text("\(weatherListModel.main.tempCelsius)°C")
                    .font(.custom("Poppins-Bold", size: 36))
                    .lineSpacing(0)
                    .frame(height: 44, alignment: .center)
            }.backgroundExtensionEffect()
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .background(Color.white)
        .cornerRadius(10)
//        .glassEffect(.regular, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    WeatherCell(weatherListModel: WeatherList())
}
