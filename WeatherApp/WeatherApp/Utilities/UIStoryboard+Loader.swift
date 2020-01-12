//
//  UIStoryboard+Loade.swift
//  WeatherApp
//
//  Created by Vaneet Modgill on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import Foundation
import UIKit


fileprivate enum Storyboard : String {
    case main = "Main"
    
}

fileprivate extension UIStoryboard {
    
    static func loadFromMain(_ identifier: String) -> UIViewController {
        return load(from: .main, identifier: identifier)
    }
    
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
    
}

// MARK: App View Controllers

extension UIStoryboard {
    //    Give all views same id and name here
//    static func loadPasscodeVC() -> PasscodeVC {
//        return loadFromMain(PasscodeVC.className) as! PasscodeVC
//    }
}


extension NSObject {
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
    
    class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}
