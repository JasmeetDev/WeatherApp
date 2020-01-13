//
//  LoginVC.swift
//  WeatherApp
//
//  Created by Jasmeet Singh on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let dt: Int
    
    struct MainData: Codable {
        let temp: Double
        let pressure: Int?
        let humidity: Float?
        let temp_min: Double?
        let temp_max: Double?
    }
    
    struct WeatherConditions: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    let main: MainData
    let weather: [WeatherConditions]
}
