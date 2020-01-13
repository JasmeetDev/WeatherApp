//
//  AppBaseViewController.swift
//  WeatherApp
//
//  Created by Jasmeet Singh on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import UIKit
import TDResult
import TDWebService

open class AppBaseViewController: UIViewController {
     
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Alert Method
    open func displayAlert(title:String, message:String, actionButtonTitle:String, controller:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionButtonTitle, style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    open func showWebServiceError(error:Error, controller:UIViewController){
        var message = error.localizedDescription ?? Constant.NetworkError.generalMessage
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    
   // MARK:- Progress Method(s)
    open func showActivityLoader(_ progressView:UIView) {
        DispatchQueue.main.async {
            LoadingIndicator.sharedInstance.showActivityIndicator(uiView: progressView, title: "")
        }
    }
    
    open func hideActivityLoader(_ progressView:UIView) {
       DispatchQueue.main.async {
            LoadingIndicator.sharedInstance.hideActivityIndicator(onView: progressView)
        }
        
    }
    
}
