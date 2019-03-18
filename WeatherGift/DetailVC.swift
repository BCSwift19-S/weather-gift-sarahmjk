//
//  DetailVC.swift
//  WeatherGift
//
//  Created by Sarah Minji Kim on 3/10/19.
//  Copyright © 2019 Sarah Minji Kim. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
//outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var currentImage: UIImageView!
    
    var currentPage = 0
    var locationsArray = [WeatherLocation]()
    
    
//viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.text = locationsArray [currentPage].name
        dateLabel.text = locationsArray[currentPage].coordinates
    
    }
}
