//
//  ViewController.swift
//  Clima_weatherApp
//
//  Created by Sadia on 4/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherConditionView: UIImageView!
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    var cityName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        cityName = searchTextField.text ?? ""
        searchTextField.resignFirstResponder()
        cityNameLabel.text = cityName
        
        if searchTextField.text != ""{
            searchTextField.placeholder = "Type something"
        }
    }
    


}

