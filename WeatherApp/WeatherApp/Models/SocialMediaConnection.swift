//
//  SocialMediaConnection.swift
//  WeatherApp
//
//  Created by Jasmeet Singh on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//


import Foundation
import UIKit
import GoogleSignIn

protocol SocialMediaConnectionsDelegate: NSObject {
    func didSuccefullyLoginWithGoogle(_ user: GIDGoogleUser)
    func failedToLoginWithError(_ error: Error)

}

class SocialMediaConnections: NSObject {
   weak var delegate: SocialMediaConnectionsDelegate?

    func signInWithGmail(_ viewController: AppBaseViewController) {
        GIDSignIn.sharedInstance()?.presentingViewController = viewController
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.signIn()

    }
    /**
     Request profile for your just logged in account
     */
    func signOut() {
        GIDSignIn.sharedInstance()?.signOut()
    }
}

extension SocialMediaConnections:  GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error    {
            print("\(error.localizedDescription)")
            delegate?.failedToLoginWithError(error)
        }
        else {
            AppCacheData.sharedInstance.user = user
            delegate?.didSuccefullyLoginWithGoogle(user)
        }
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        }
    }
}
