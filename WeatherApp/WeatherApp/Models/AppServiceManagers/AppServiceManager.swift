//
//  AppServiceManager.swift
//  Gamigado
//
//  Created by Vaneet Modgill on 13/02/17.
//  Copyright © 2018 Vaneet Modgill. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class AppServiceManager: NSObject {
    lazy var networkReachabilityNotifier:NetworkReachabilityNotifier = NetworkReachabilityNotifier()
    lazy var appdelegate = UIApplication.shared.delegate as! AppDelegate
    var homeScreenNavController = UINavigationController()
    var mainViewController:UIViewController?
  
    
    override init() {
        super.init()
        networkReachabilityNotifier.delegate = self
        
    }
    
    func initiateAppServices() {
        initiateNetworkReachabilityObserver()
        IQKeyboardManager.shared.enable = true
    
//        setupUserDetails()
      
    }
    
    
    func setupUserDetails(){
        if let _ = UserDefaults.standard.value(forKey: "userId") as? String {
            navigateToHomeScreen()
        } else {
            navigateToLoginScreen()
        }
    }
    
    
}




