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
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            self.data = try decoder.decode(WeatherData.self, from: data)
            self.didLoadSuccessfully = true
            print(data)
            
        }  catch let DecodingError.dataCorrupted(context) {
            self.error = "dataCorrupted(\(context))"
            self.didLoadSuccessfully = false
            print(Error.corruptedData.rawValue)
            
        } catch let DecodingError.keyNotFound(key, context) {
            self.error = "keyNotFound(\(key), \(context))"
            self.didLoadSuccessfully = false
            print(Error.keyNotFound.rawValue)
            
        } catch {
            self.error = error.localizedDescription
            self.didLoadSuccessfully = false
            print(error)
        }
    }
}

