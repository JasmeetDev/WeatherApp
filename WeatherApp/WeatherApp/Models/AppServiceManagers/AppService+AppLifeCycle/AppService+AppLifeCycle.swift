//
//  AppService+AppLifeCycle.swift
//  Gamigado
//
//  Created by Vaneet Modgill on 28/03/17.
//  Copyright © 2018 Vaneet Modgill. All rights reserved.
//
import UIKit
import GoogleSignIn
import GooglePlaces

extension(AppServiceManager){
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initiateAppServices()
        
        GIDSignIn.sharedInstance().clientID = AppConfigurations.googleClientKey()
        GMSPlacesClient.provideAPIKey(AppConfigurations.googlePlaceApiKey())
        
   
        return true
    }
    
    
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    

    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
  
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }   
    
}


