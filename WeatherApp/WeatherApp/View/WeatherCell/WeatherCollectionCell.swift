//
//  WeatherCollectionCell.swift
//  WeatherApp
//
//  Created by Vaneet Modgill on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import UIKit

class WeatherCollectionCell: UICollectionViewCell {
    
    var weatherData: WeatherData? {
        didSet {
            guard let data = weatherData, let min = data.main.temp_min, let max = data.main.temp_max else {
                return
            }
            self.mainLabel.text = "MIN/MAX: \(min)/\(max)"
            self.updateImage()
        }
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    func updateImage() {
        guard let data = weatherData else {
            return
        }
        
        let temperature = data.main.temp
        var clothes: String = ""
        
        if temperature < 15 {
            clothes = "Jacket + Sweater + T-Shirt"
            imageView.image = UIImage(named: "winter-jacket")
        } else if temperature < 20 {
            clothes = "Sweater + T-Shirt"
            imageView.image = UIImage(named: "sweater")
        } else {
            clothes = "T-Shirt"
            imageView.image = UIImage(named: "tshirt")
        }
        
        labelDescription.text = clothes
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


extension UIImageView {
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.tintColorDidChange()
    }
}
