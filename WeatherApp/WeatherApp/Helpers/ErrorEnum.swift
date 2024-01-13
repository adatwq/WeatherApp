//
//  ErrorEnum.swift
//  WeatherApp
//
//  Created by ADATWQ on 04/01/2024.
//

import Foundation

enum Error : String{
    case undecodableData = "data is undecodable"
    case corruptedData = "data has been corrupted"
    case keyNotFound = "key was not found"
}
