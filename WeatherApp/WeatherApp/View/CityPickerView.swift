//
//  ContentView.swift
//  WeatherApp
//
//  Created by ADATWQ on 04/01/2024.
//

import SwiftUI

struct CityPickerView: View {
    
    @State var showWeatherForcast: Bool = false
    @State var cityName: String = ""
    @State var error: String = ""
    
    var body: some View {
        VStack {
          if !error.isEmpty {
            Text(error)
              .foregroundColor(.red)
          }
          HStack {
            TextField("", text: $cityName, prompt: Text("City name"))
                  .padding()
              .background(
                RoundedRectangle(cornerRadius: 8)
                  .stroke(.gray)
              )
              .frame(maxWidth: .infinity)
            Button(action: {
              if cityName.isEmpty {
                error = "please enter a city name"
                  showWeatherForcast = false
              } else {
                error = ""
                  showWeatherForcast = true
              }
            }, label: {
              Text("Go")
                .padding()
                .bold()
                .background(
                  RoundedRectangle(cornerRadius: 8)
                    .stroke(.blue)
                )
            })
          }
          Spacer()
        }
        .sheet(isPresented: $showWeatherForcast, content: {
            WeatherForecastView(cityName: cityName)
        })
        .padding()
    }
}

#Preview {
    CityPickerView(cityName: "Riyadh")
}
