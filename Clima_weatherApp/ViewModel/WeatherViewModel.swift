//
//  WeatherViewModel.swift
//  Clima_weatherApp
//
//  Created by Sadia on 11/8/23.
//

import Foundation
import CoreLocation

protocol WeatherProtocol {
    func showWeatherData(weatherModel: WeatherModel)
    func showWeatherError(error: Error)
}

class WeatherViewModel {

    var delegate: WeatherProtocol?
    
    // MARK: - GET DATA By city name
    
    func getWeatherData(cityName: String){
        
        NetworkManager.shared.httpRequest(urlString: API.CITY_NAME_URL+cityName, httpMethodType: .GET, respnseType: WeatherData.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    
                    guard let conditionId =  success.weather?[0].id else {return}
                    guard let cityName =  success.name else {return}
                    guard let temperature =  success.main?.temp else {return}
                    
                    let weatherModel = WeatherModel(conditionId: conditionId, cityName: cityName, temperature: temperature)
                    
                    self.delegate?.showWeatherData(weatherModel: weatherModel)
                    
                case .failure(let failure):
                    self.delegate?.showWeatherError(error: failure)
                }
            }
           
        }
    }
    
    // MARK: - GET DATA By location
    
    func getWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        
        NetworkManager.shared.httpRequest(urlString: API.BASE_URL+"&lat=\(latitude)&lon=\(longitude)", httpMethodType: .GET, respnseType: WeatherData.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    
                    guard let conditionId =  success.weather?[0].id else {return}
                    guard let cityName =  success.name else {return}
                    guard let temperature =  success.main?.temp else {return}
                    
                    let weatherModel = WeatherModel(conditionId: conditionId, cityName: cityName, temperature: temperature)
                    
                    self.delegate?.showWeatherData(weatherModel: weatherModel)
                    
                case .failure(let failure):
                    self.delegate?.showWeatherError(error: failure)
                }
            }
           
        }
    }
    
}
