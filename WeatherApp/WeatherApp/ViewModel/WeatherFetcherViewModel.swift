//
//  WeatherFetcherViewModel.swift
//  WeatherApp
//
//  Created by ADATWQ on 04/01/2024.
//

import Foundation

final class WeatherFetcherViewModel: ObservableObject {
    
    
    @Published var data: WeatherData = .init()
    @Published var error: String = ""
    @Published var didLoadSuccessfully: Bool? = .none
    
    
    func fetch(cityName: String) {
        
        //MARK: Do your fetching here using URLSession
     
    }
}
