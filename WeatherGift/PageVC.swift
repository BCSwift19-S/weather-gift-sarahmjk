//
//  PageVC.swift
//  WeatherGift
//
//  Created by Sarah Minji Kim on 3/10/19.
//  Copyright © 2019 Sarah Minji Kim. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    

// variables
    var currentPage = 0
    var locationsArray = ["Local City", "Syndney, Austrailia", "Accra, Ghana", "Uglich, Russia"]
    
    
    
//Viewdidload

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        setViewControllers([createDetailVC(forPage: 0)], direction: .forward, animated: false, completion: nil)

    }

    
//fuction
    func createDetailVC (forPage page: Int) -> DetailVC {
        
        currentPage =  min (max (0, page), locationsArray.count-1)
        
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.locationsArray = locationsArray
        detailVC.currentPage = currentPage
        
        return detailVC
        
        
    }
}






//extension
extension PageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
    }
}
