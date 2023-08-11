//
//  WeatherViewModel.swift
//  Clima_weatherApp
//
//  Created by Sadia on 11/8/23.
//

import Foundation

protocol WeatherProtocol {
    func showWeatherData(weatherModel: WeatherModel)
    func showWeatherError(error: Error)
}

class WeatherViewModel {

    var delegate: WeatherProtocol?
    
    // MARK: - GET DATA
    
    func getWeatherData(cityName: String){
        
        NetworkManager.shared.httpRequest(urlString: API.CITY_NAME_URL+cityName, httpMethodType: .GET, respnseType: WeatherModel.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.delegate?.showWeatherData(weatherModel: success)
                case .failure(let failure):
                    self.delegate?.showWeatherError(error: failure)
                }
            }
           
        }
    }
    
    func getWeatherByLatLong(cityName: String){
        
        NetworkManager.shared.httpRequest(urlString: API.CITY_NAME_URL+cityName, httpMethodType: .GET, respnseType: WeatherModel.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.delegate?.showWeatherData(weatherModel: success)
                case .failure(let failure):
                    self.delegate?.showWeatherError(error: failure)
                }
            }
           
        }
    }
    
    
}
