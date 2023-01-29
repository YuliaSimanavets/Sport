//
//  CustomTabBarController.swift
//  Sport
//
//  Created by Yuliya on 18/01/2023.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sportsDataManager = SportsDataManager()
        let generalViewController = GeneralViewController()
        let favouritesViewController = FavouritesViewController()
        
        generalViewController.set(sportsDataManager)
        
        self.setViewControllers([generalViewController, favouritesViewController], animated: false)
        guard let items = tabBar.items else { return }
        
        let images = ["tablecells.badge.ellipsis", "star.bubble"]
        for i in 0..<images.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .yellow
    }
}
