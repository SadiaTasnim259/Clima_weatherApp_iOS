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
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        cityName = searchTextField.text ?? ""
        searchTextField.resignFirstResponder()
        cityNameLabel.text = cityName
        
        if searchTextField.text == "" {
            searchTextField.placeholder = "Type something"
        }
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
}

