//
//  SettingsViewController.swift
//  Sport
//
//  Created by Yuliya on 18/01/2023.
//

import UIKit

class FavouritesViewController: UIViewController {

    private let myButton: UIButton = {
        let but = UIButton()
        but.backgroundColor = .orange
        but.setTitle("Tap", for: .normal)
        but.setTitle("Tapped", for: .highlighted)
        but.layer.cornerRadius = 10
        but.translatesAutoresizingMaskIntoConstraints = false
        return but
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(tapMyButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc
    func tapMyButton() {
        let vc = UINavigationController(rootViewController: SportDetailsViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
//        navigationController?.pushViewController(vc, animated: true)
    }
}
