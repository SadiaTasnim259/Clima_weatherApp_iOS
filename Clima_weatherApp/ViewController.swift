//
//  ViewController.swift
//  Clima_weatherApp
//
//  Created by Sadia on 4/8/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var weatherViewModel = WeatherViewModel()
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherConditionView: UIImageView!
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        weatherViewModel.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        guard let cityName = searchTextField.text, !cityName.isEmpty else{
            searchTextField.placeholder = "Enter Your City"
            self.showToast(message: "Please Enter Your City", bottomPadding: 120)
            return
        }
        
        weatherViewModel.getWeatherData(cityName: cityName)
        searchTextField.resignFirstResponder()
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}


extension ViewController: WeatherProtocol{
    func showWeatherData(weatherModel: WeatherModel) {
        cityNameLabel.text = weatherModel.cityName
        temparatureLabel.text = "\(weatherModel.temperatureString)"
        weatherConditionView.image = UIImage(systemName: weatherModel.ConditionName)
    }
    
    func showWeatherError(error: Error) {
        self.showToast(message: error.localizedDescription, bottomPadding: 120)
    }
}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherViewModel.getWeatherData(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Error : \(error.localizedDescription)")
    }
}

                                                                        
