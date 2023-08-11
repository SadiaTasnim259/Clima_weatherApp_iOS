//
//  ViewController.swift
//  Clima_weatherApp
//
//  Created by Sadia on 4/8/23.
//

import UIKit

class ViewController: UIViewController {
    var weatherViewModel = WeatherViewModel()
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherConditionView: UIImageView!
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        weatherViewModel.delegate = self
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        guard let cityName = searchTextField.text, !cityName.isEmpty else{
            searchTextField.placeholder = "Enter Your City"
            self.showToast(message: "Please Enter Your City", bottomPadding: 120)
            return
        }
        
        weatherViewModel.getWeatherData(cityName: cityName)
        searchTextField.resignFirstResponder()
        cityNameLabel.text = cityName
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}


extension ViewController: WeatherProtocol{
    func showWeatherData(weatherModel: WeatherModel) {
        temparatureLabel.text = "\(weatherModel.temperatureString)"
        weatherConditionView.image = UIImage(systemName: weatherModel.ConditionName)
    }
    
    func showWeatherError(error: Error) {
        self.showToast(message: error.localizedDescription, bottomPadding: 120)
    }
}

                                                                        
