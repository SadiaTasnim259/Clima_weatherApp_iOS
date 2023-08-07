//
//  URLConstant.swift
//  Clima_weatherApp
//
//  Created by Sadia on 7/8/23.
//

import Foundation

enum API{
    static let BASE_URL = "http://192.168.0.227:3000/"
    
    static let GET_ALL_PRODUCTS = BASE_URL+"products"
    static let POST_PRODUCT = BASE_URL+"product"
    static let DELETE_PRODUCT = BASE_URL+"products/"
    
    static let UPDATE_PRODUCT = BASE_URL+"products/"
}
