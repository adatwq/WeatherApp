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
    
    func fetch(cityName: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                self.error = error?.localizedDescription ?? "Undefined Error"
                self.didLoadSuccessfully = false
                print(self.error)
                return
            }
            
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
        }
        task.resume()
    }
}
