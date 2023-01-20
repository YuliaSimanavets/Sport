//
//  ViewController.swift
//  Sport
//
//  Created by Yuliya on 18/01/2023.
//

import UIKit

class GeneralViewController: UIViewController {

    var sportsDataManager: SportsDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }
    
    func setSportsDataManager(data: SportsDataManager) {
        sportsDataManager = data
    }
}

