//
//  WeatherFetcherViewModel.swift
//  WeatherApp
//
//  Created by ADATWQ on 04/01/2024.
//

import Foundation

final class WeatherFetcherViewModel: ObservableObject {
    
    let apiKey: String
    
    @Published var data: WeatherData = .init()
    @Published var error: String = ""
    @Published var didLoadSuccessfully: Bool? = .none
    
    init() {
        apiKey = "paste your weather API key here"
//        -> you can generate yours for free at https://openweathermap.org/api
    }
    
    func fetch(cityName: String) async {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
        let url = URL(string: urlString)!
        
        if let (data, _) = try? await URLSession.shared.data(from: url) {
            let decoder = JSONDecoder()
            if let decodedWeatherData = try? decoder.decode(WeatherData.self, from: data) {
                self.data = decodedWeatherData
                self.didLoadSuccessfully = true
                print(data)
            } else {
                self.didLoadSuccessfully = false
                self.error = "Undecodable data"
                print("Undecodable data")
            }
        } else {
            self.error = "Unhandled Error"
            self.didLoadSuccessfully = false
          }
    }
}
