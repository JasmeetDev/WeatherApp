//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Vaneet Modgill on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//
//369233554511-d8c5lefoqlbsi4g79puv775v47do7d2q.apps.googleusercontent.com
//
//com.googleusercontent.apps.369233554511-d8c5lefoqlbsi4g79puv775v47do7d2q

import UIKit
import GooglePlaces
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var applicationServiceManager:AppServiceManager = AppServiceManager()
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        return applicationServiceManager.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
          applicationServiceManager.applicationDidEnterBackground(application)
      }
      
      func applicationWillEnterForeground(_ application: UIApplication) {
          applicationServiceManager.applicationWillEnterForeground(application)
      }
    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }

}

