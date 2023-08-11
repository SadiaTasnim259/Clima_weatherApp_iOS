//
//  GetWeatherModel.swift
//  Clima_weatherApp
//
//  Created by Sadia on 11/8/23.
//

import Foundation

struct WeatherData: Codable{
    var name: String?
    var main: Main?
    var weather: [Weather]?
}

struct Main: Codable {
    var temp: Double?
}

struct Weather: Codable {
    var id: Int?
    var main, description, icon: String?
}
