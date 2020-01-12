//
//  LoginVC.swift
//  WeatherApp
//
//  Created by Vaneet Modgill on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginVC: AppBaseViewController {

    let socialMediaConnection = SocialMediaConnections()
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        socialMediaConnection.delegate = self

    }
    
        //MARK: - Actions
    @IBAction func btnLoginWithGoogleClicked(_ sender: Any) {
        socialMediaConnection.signInWithGmail(self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginVC: SocialMediaConnectionsDelegate {
    func didSuccefullyLoginWithGoogle(_ user: GIDGoogleUser) {
        self.performSegue(withIdentifier: Constant.SegueIdentifier.home, sender: nil)
    }
    func failedToLoginWithError(_ error: Error) {
        self.showWebServiceError(error: error, controller: self)
    }
}
