//
//  WeatherForecastView.swift
//  WeatherApp
//
//  Created by ADATWQ on 04/01/2024.
//

import SwiftUI

struct WeatherForecastView: View {
    
    let cityName: String
    @StateObject var weatherViewModel: WeatherFetcherViewModel = .init()
    
    var body: some View {
        ScrollView {
            VStack {
                if weatherViewModel.didLoadSuccessfully == nil {
                    HStack {
                        Circle()
                            .fill(.orange)
                            .frame(width: 12, height: 12)
                        Text("Loading ..")
                            .font(.title)
                        Spacer()
                    }
                    .padding()
                    Spacer(minLength: 250)
                    ProgressView()
                        .scaleEffect(4)
                } else if weatherViewModel.didLoadSuccessfully == true {
                    HStack {
                        Circle()
                            .fill(.green)
                            .frame(width: 12, height: 12)
                        Text("Success")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    .padding()
                    Divider()
                    HStack {
                        Text("Temperature:")
                            .padding()
                       
                        
                        if let temp = weatherViewModel.data.main?.temp?.description {
                            Text(temp)
                                .padding()
                            Spacer()
                        } else {
                            Spacer()
                            Text("Unable to load Temperature")
                                .padding()
                        }
                    }
                    Divider()
                } else {
                    HStack {
                        Circle()
                            .fill(.red)
                            .frame(width: 10, height: 10)
                        Text("Error")
                            .font(.title)
                        Spacer()
                    }
                    .padding()
                    Divider()
                    Text(weatherViewModel.error)
                        .padding()
                }
            }
        }
        .navigationTitle("\(cityName.capitalized) Weather")
        .onAppear(perform: {
            weatherViewModel.fetch(cityName: cityName)
        })
    }
}

#Preview {
    WeatherForecastView(cityName: "")
}
