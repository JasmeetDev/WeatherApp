//
//  Constants.swift
//  WeatherApp
//
//  Created by Vaneet Modgill on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import Foundation

struct Constant {
    static let placeholderImageName = "placeholder"
    struct NetworkError {
        static let generalMessage          = "Something went wrong. Please try again after some time"
        static let networkNotReachable      = "LocalizedStringEnum.NetworkNotReachable.localized"
    }
    
    struct SegueIdentifier {
        static let home = "SegueHome"
        static let weather = "SegueWeather"
    }
//    struct UserDefaultKeys {
//        static let userModel               = "AppMainUser"
//        static let languageModel           = "LanguageData"
//        static let companySelected         = "Company"
//        static let baseURLs                = "baseURLs"
//        static let sounds                = "sounds"
//        static let notificationPopUp       = "notificationPopUp"
//        static let themeColor =       "themeColor"
//        static let appleLanguagesKey = "AppleLanguages"
//
//    }
// 
//    struct Settings {
//        static let termsConditions = "settings/TermsandConditions.php"
//        static let privacy = "settings/Privacypolicy.php"
//        static let aboutUs = "settings/About_us.php"
//        static let helpFAQ = "settings/HelpandFAQ.php"
//    }
}
