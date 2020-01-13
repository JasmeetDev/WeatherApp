//
//  WaetherDetailVC.swift
//  WeatherApp
//
//  Created by Jasmeet Singh on 12/01/20.
//  Copyright © 2020 Jasmeet. All rights reserved.
//

import UIKit

class WeatherDetailVC: AppBaseViewController {
    var weatherData: WeatherData?
    var cityName: String?
        
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        showActivityLoader(self.view)
        if let city = cityName {
            getWeatherData(cityName: city, countryCode: "", scale: .celsius)
        }
    }
    
    func getWeatherData(cityName: String, countryCode: String, scale: TemperatureScale) {
        WeatherAPI.shared.getCurrentWeather(cityName: cityName, countryCode: countryCode, tempScale: scale) { (data) in
            self.updateUI(weatherData: data, scale: scale)
        }
    }
    
    func updateUI(weatherData: WeatherData, scale: TemperatureScale) {
        DispatchQueue.main.async {
            self.hideActivityLoader(self.view)
            self.labelTemperature.text = String(weatherData.main.temp) + " \(scale.symbolForScale())"
            self.weatherData = weatherData
            self.collectionView.reloadData()
        }
    }
    
    func getCurrentTemperatureScaleSelection() -> TemperatureScale {
        return .celsius

    }
}

extension WeatherDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionCell.className, for: indexPath) as? WeatherCollectionCell else {
            return UICollectionViewCell()
        }
        cell.weatherData = weatherData
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItems = 1
        pageControl.numberOfPages = numberOfItems
        return numberOfItems
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: WeatherCollectionCell.className, bundle: nil), forCellWithReuseIdentifier: WeatherCollectionCell.className)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

extension WeatherDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
