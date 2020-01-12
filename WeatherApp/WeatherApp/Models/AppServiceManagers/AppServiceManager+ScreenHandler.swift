//
//  AppServiceManager+ScreenHandler.swift
//  Gamigado
//
//  Created by Vaneet Modgill on 14/12/18.
//  Copyright © 2018 SDNATech. All rights reserved.
//
import UIKit

extension(AppServiceManager){
    
     func navigateToLoginScreen() {
        let vc = UIStoryboard.loadLoginVC() //loadVideoTutorialViewController()
        mainViewController = vc
        self.appdelegate.window?.rootViewController = homeScreenNavController
        homeScreenNavController.viewControllers =  [mainViewController!]
    }
    
    
    
     func navigateToHomeScreen(){
        mainViewController = UIStoryboard.loadHomeVC()
        self.appdelegate.window?.rootViewController = homeScreenNavController
        homeScreenNavController.viewControllers =  [mainViewController!]
        homeScreenNavController.isNavigationBarHidden = true
    }
 
    
}

