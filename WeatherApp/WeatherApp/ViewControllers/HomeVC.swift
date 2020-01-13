//
//  HomeVC.swift
//  WeatherApp
//
//  Created by Jasmeet Singh on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import UIKit
import GooglePlaces

class HomeVC: AppBaseViewController {
    
    @IBOutlet weak var txtInputField: UITextField!
    
    var cityName: String?
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        txtInputField.setLeftPadding(15)
        txtInputField.placeholder = "Select city"
        txtInputField.addTarget(self, action: #selector(didSelectInputField(_:)), for: .touchDown)
    }
    
    @objc func didSelectInputField(_ textField: UITextField) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
            UInt(GMSPlaceField.placeID.rawValue))!
        autocompleteController.placeFields = fields
        
        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter
        
        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
        
    }
    
    //MARK:- Private methods
    
    private func validateInput() -> (Bool, String?) {
        if txtInputField.text!.isEmpty {
            return (false, "Please select city to proceed.")
        }
        return (true, nil)
    }
    
    private func navigateToWeatherScreen() {
        self.performSegue(withIdentifier: Constant.SegueIdentifier.weather, sender: nil)
    }
    @IBAction func btnSubmitClicked(_ sender: Any) {
        if validateInput().0 == true {
            navigateToWeatherScreen()
        } else {
            self.displayAlert(title: "", message: validateInput().1 ?? "", actionButtonTitle: "Ok", controller: self)
        }
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let weatherDetailVC = segue.destination as! WeatherDetailVC
        weatherDetailVC.cityName = cityName
    }
    
}


extension HomeVC: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        dismiss(animated: true) {
            self.cityName = place.name
            print(place.coordinate)
            self.txtInputField.text = place.name
        }
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
}
