//
//  EventHandler.swift
//  Clima_weatherApp
//
//  Created by Sadia on 7/8/23.
//

import Foundation

// MARK: - Event

enum Event{
    case loading
    case stopLoading
    case dataLoaded
    case error(String?)
}
