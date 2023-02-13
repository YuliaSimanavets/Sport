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

        generateTabBar()
        setTabBarAppearance()

    }
    
    private func generateTabBar() {
        
        let generalVC = GeneralViewController()
        let favoritesVC = FavouritesViewController()
        
        let sportDataManager = SportsDataManager()
        generalVC.set(sportDataManager)
        
        viewControllers = [
            generateVC(viewController: generalVC,
                       title: "Schedule",
                       image: UIImage(systemName: "tablecells.badge.ellipsis"),
                       backgroundColor: UIColor.backViewControllers),
            generateVC(viewController: favoritesVC,
                       title: "Favourites",
                       image: UIImage(systemName: "star.bubble"),
                       backgroundColor: UIColor.backViewControllers)
            ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?, backgroundColor: UIColor) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.view.backgroundColor = backgroundColor
        return viewController
    }
    
    private func setTabBarAppearance() {
        let posicionOnX: CGFloat = 10
        let posicionOnY: CGFloat = 10
        
        let width = tabBar.bounds.width - posicionOnX * 2
        let height = tabBar.bounds.height + posicionOnY * 2
        
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: posicionOnX,
                                y: tabBar.bounds.minY - posicionOnY,
                                width: width,
                                height: height),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 3
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = .tabBarAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
