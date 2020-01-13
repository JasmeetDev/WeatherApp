//
//  AppService+UserActivity.swift
//  Gamigado
//
//  Created by Jasmeet Singh on 19/12/18.
//  Copyright © 2018 SDNATech. All rights reserved.
//

import Foundation
import TDResult
import TDWebService
import GoogleSignIn

extension(AppServiceManager){
    
    func shouldContinueUserActivity(_ application: UIApplication, userActivityType: String)->Bool{
        return true
    }
    
    func continueUserActivity(_ application: UIApplication,
                              userActivity: NSUserActivity,
                              restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        switch userActivity.activityType
        {
        case NSUserActivityTypeBrowsingWeb:
            guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
                let url = userActivity.webpageURL,
                let _ = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
                    return false
            }
            print(url)
            
        default:
            
            print("")
        }
        
        return false
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        if url.absoluteString.contains("google") {
            return GIDSignIn.sharedInstance().handle(url)
        }
        return true
    }
    @available(iOS 9.0, *)
    func application(app: UIApplication, url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        
        if url.absoluteString.contains("google") {
            return GIDSignIn.sharedInstance()!.handle(url as URL)
        }
        
        return true
    }
}


