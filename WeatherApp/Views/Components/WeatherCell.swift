//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import SwiftUI


struct WeatherCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Monday")
                .font(.custom("Poppins-SemiBold", size: 16))
                .lineSpacing(0)
                .frame(height: 24, alignment: .center)
            HStack {
                Image("Cloudy")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
                Spacer()
                Text("30°")
                    .font(.custom("Poppins-Bold", size: 36))
                    .lineSpacing(0)
                    .frame(height: 44, alignment: .center)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    WeatherCell()
}
