//
//  AppService+NetworkReachability.swift
//  Gamigado
//
//  Created by Jasmeet Singh on 19/04/17.
//  Copyright © 2018 Jasmeet Singh. All rights reserved.
//

import Foundation
import UIKit
extension(AppServiceManager):NetworkReachabilityNotifierDelegate{
    
    func initiateNetworkReachabilityObserver(){
        networkReachabilityNotifier.initateNotification()
    }
    
    //MARK:- DELEGATE METHOD(S)
    
    func networkReachable(isReachable: Bool, rechableType: NetworkReachabilityNotifier.ReachableType) {
            AppCacheData.sharedInstance.isNetworkAvailable = isReachable
        if isReachable{
    
        }
        else{
//            UIApplication.shared.keyWindow!.rootViewController!.view.makeToast("Internet connection not available", duration: 2.0, position: ToastPosition.bottom, title: nil, image: nil, style: ToastManager.shared.style) { (completion) in
//            }

        }
    }
}
