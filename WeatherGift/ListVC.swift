//
//  ListVC.swift
//  WeatherGift
//
//  Created by Sarah Minji Kim on 3/10/19.
//  Copyright © 2019 Sarah Minji Kim. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var locationsArray = [String]()
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPageVC"{
            let destination = segue.destination as! PageVC
            currentPage = (tableView.indexPathForSelectedRow?.row)!
            destination.currentPage = currentPage
            destination.locationsArray = locationsArray
        }
    }
}



extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,numberOfRowsInSection: Int)-> Int {
        return locationsArray.count
    }
    func tableView ( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        cell.textLabel!.text = locationsArray [indexPath.row]
        return cell
    }
}

