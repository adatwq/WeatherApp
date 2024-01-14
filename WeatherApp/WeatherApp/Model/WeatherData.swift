//
//  WeatherData.swift
//  WeatherApp
//
//  Created by ADATWQ on 04/01/2024.
//

import Foundation

// MARK: - WeatherData
struct WeatherData{
  var coord: Coord?
  var weather: [Weather]?
  var base: String?
  var main: Main?
  var visibility: Int?
  var wind: Wind?
  var clouds: Clouds?
  var dt: Int?
  var sys: Sys?
  var timezone: Int?
  var id: Int?
  var name: String?
  var cod: Int?

  // MARK: - Clouds
  struct Clouds{
    var all: Int?
  }
  
  // MARK: - Coord
  struct Coord{
    var lon: Double?
    var lat: Double?
  }
  
  // MARK: - Main
  struct Main{
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var humidity: Int?
  }
  
  // MARK: - Sys
  struct Sys{
    var type: Int?
    var id: Int?
    var country: String
    var sunrise: Int?
    var sunset: Int?
  }
  
  // MARK: - Weather
  struct Weather{
    var id: Int?
    var main: String?
    var weatherDescription: String?
    var icon: String?
  }
  
  // MARK: - Wind
  struct Wind{
    var speed: Double?
    var deg: Int?
  }
}
