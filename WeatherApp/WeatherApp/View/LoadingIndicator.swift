//
//  LoadingIndicator.swift
//  WeatherApp
//
//  Created by Jasmeet Singh on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD


class LoadingIndicator {
    
    static let sharedInstance = LoadingIndicator()
    var container: UIView = UIView()
    let imageView = UIView()
    var isLoading = false
    
    private  init() {
    }
    
    
    func showActivityIndicator(uiView: UIView, title:String) {
        if self.isLoading { return }
        self.isLoading = true
        let loadingNotification = MBProgressHUD.showAdded(to: uiView, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading..."
    }
    
    func hideActivityIndicator(onView:UIView) {
        self.isLoading = false
        MBProgressHUD.hide(for: onView, animated: true)
        
    }
}
