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
        
        let sportsData = SportsData()
        let general = GeneralViewController()
        let settings = SettingsViewController()
        
        general.setSportsData(data: sportsData)
        
        self.setViewControllers([general, settings], animated: false)
        guard let items = tabBar.items else { return }
        
        let images = ["tablecells.badge.ellipsis", "gearshape"]
        for i in 0..<images.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .yellow
    }
}
