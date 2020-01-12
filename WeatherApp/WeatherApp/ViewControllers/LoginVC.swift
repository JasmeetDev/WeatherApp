//
//  LoginVC.swift
//  WeatherApp
//
//  Created by Vaneet Modgill on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import UIKit
import GoogleSignIn
import LocalAuthentication

class LoginVC: AppBaseViewController {

    @IBOutlet weak var biometricButton: UIButton!
    let socialMediaConnection = SocialMediaConnections()
    
    var biometricAttempts = 0 {
        didSet {
            if self.biometricAttempts  > 3 {
                self.displayAlert(title: "", message: "You have exceeded number of attempts. Please try later", actionButtonTitle: "Ok", controller: self)
            }
        }
    }
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        biometricAttempts = 0
        socialMediaConnection.delegate = self
    }
    
    
    
        //MARK: - Actions
    @IBAction func btnLoginWithGoogleClicked(_ sender: Any) {
        socialMediaConnection.signInWithGmail(self)
    }
    
    @IBAction func btnLoginWithBiometricsClicked(_ sender: Any) {
        loginWithBiometrics()
    }
    private func loginWithBiometrics() {
                
        let myContext = LAContext()
        let reasonString = "Biometric login"
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) { success, evaluateError in
                    DispatchQueue.main.async {
                        if success {
                            self.performSegue(withIdentifier: Constant.SegueIdentifier.home, sender: nil)
                        } else {
                            self.biometricAttempts = self.biometricAttempts + 1
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
//                successLabel.text = "Sorry!!.. Could not evaluate policy."
            }
        }
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
