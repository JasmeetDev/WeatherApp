//
//  LoginVC.swift
//  WeatherApp
//
//  Created by Jasmeet Singh on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import Foundation

enum TemperatureScale: String {
    case celsius = "metric"
    case kelvin = "kelvin"
    case fahrenheit = "imperial"
    
    func symbolForScale() -> String {
        switch(self) {
        case .celsius:
            return "℃"
        case .kelvin:
            return "K"
        case .fahrenheit:
            return "℉"
        }
    }
}
