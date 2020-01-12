//
//  AppCacheData.swift
//  WeatherApp
//
//  Created by Vaneet Modgill on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import Foundation
import GoogleSignIn

class AppCacheData: NSObject {
        
    static let sharedInstance = AppCacheData()
    
    //#MARK: Server settings
    var user = GIDGoogleUser()
    
    private override init() {
        super.init()
    }
    var isNetworkAvailable = false
    
}
