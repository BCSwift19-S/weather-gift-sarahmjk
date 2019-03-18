//
//  DetailVC.swift
//  WeatherGift
//
//  Created by Sarah Minji Kim on 3/10/19.
//  Copyright © 2019 Sarah Minji Kim. All rights reserved.
//

import UIKit
import CoreLocation

class DetailVC: UIViewController {
    
//outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var currentImage: UIImageView!
    
    var currentPage = 0
    var locationsArray = [WeatherLocation]()
    var locationManager : CLLocationManager!
    var currentLocation : CLLocation!
    
    
//viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.text = locationsArray [currentPage].name
        dateLabel.text = locationsArray[currentPage].coordinates
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if currentPage == 0 {
            getLocation()
        }
    }
}

extension DetailVC : CLLocationManagerDelegate {
    func getLocation () {
        locationManager = CLLocationManager ()
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        handleAuthourizationStatus(status: status)
    }
    func handleAuthourizationStatus (status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse :
            locationManager.requestLocation()
        case .denied:
            print ("I'm sorry-cannot show location")
        case .restricted:
            print ("Access denied")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        handleAuthourizationStatus(status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last
        let currentLatitude = currentLocation.coordinate.latitude
        let currentLongitude = currentLocation.coordinate.longitude
        let currentCoordinates = "\(currentLatitude), \(currentLongitude)"
        print (currentCoordinates)
        dateLabel.text = currentCoordinates
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print ("did fail")
    }
}
