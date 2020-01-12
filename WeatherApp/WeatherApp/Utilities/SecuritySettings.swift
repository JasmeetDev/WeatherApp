//
//  SecuritySettings.swift
//  WeatherApp
//
//  Created by Vaneet Modgill on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import Foundation
import KeychainSwift

enum SecuritySelected : String{
    case Pin = "Pin"
    case PinAndBioMetric = "PinAndBioMetric"
    case Biometric = "Biometric"
    case none = "none"
}

class SecuritySettings {
    
    static func savePasscode(passcode:String){
        let keychain = KeychainSwift()
        keychain.set(passcode, forKey: "login_passcode")
    }
    
    static func getPasscode()->String?{
        let keychain = KeychainSwift()
        return keychain.get("login_passcode")
    }

    static func clearPasscode(){
        let keychain = KeychainSwift()
        keychain.delete("login_passcode")
    }
    
    
    static func getSecurityType()->SecuritySelected {
        let pinAvailable:Bool  =  UserDefaults.standard.value(forKey: SecuritySelected.Pin.rawValue) as? Bool ?? false
         let bioMatricAvailable:Bool  =  UserDefaults.standard.value(forKey: SecuritySelected.Biometric.rawValue) as? Bool ?? false
        if pinAvailable && bioMatricAvailable {
            return .PinAndBioMetric
        } else if pinAvailable {
            return .Pin
        } else if bioMatricAvailable {
            return .Biometric
        } else {
            return .none
        }
    }
    
    static func setSecurityTypeStatus(isActive:Bool, type:SecuritySelected){
        switch type {
        case .Pin, .Biometric:
            UserDefaults.standard.set(isActive, forKey: type.rawValue)
        default:
            break
        }
    }
    
    
    static func clearAllPasscodeSettings(){
        self.setSecurityTypeStatus(isActive: false, type: .Biometric)
        self.setSecurityTypeStatus(isActive: false, type: .Pin)
        self.clearPasscode()
    }
}
