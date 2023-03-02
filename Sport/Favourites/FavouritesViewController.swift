//
//  SettingsViewController.swift
//  Sport
//
//  Created by Yuliya on 18/01/2023.
//

import UIKit

class FavouritesViewController: UIViewController,
                                UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    private enum CellType {
        case team(TeamDetailsViewModel)
        case schedule(ScheduleDetailsViewModel)
    }

    private var favouritesDataManager: FavouritesDataManager?
    
    private let favouritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        layout.scrollDirection = .vertical
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var favourites = [CellType]()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        favourites = favouritesDataManager?.getData() ?? []
        favouritesCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.addSubview(favouritesCollectionView)
        favouritesCollectionView.delegate = self
        favouritesCollectionView.dataSource = self
        
        favouritesCollectionView.register(TeamDetailsCollectionViewCell.self,
                                          forCellWithReuseIdentifier: TeamDetailsCollectionViewCell.identifier)
        favouritesCollectionView.register(ScheduleDetailsCollectionViewCell.self,
                                          forCellWithReuseIdentifier: ScheduleDetailsCollectionViewCell.identifier)
        
//        favourites = favouritesDataManager?.getData() ?? []
        
        NSLayoutConstraint.activate([
            favouritesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favouritesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            favouritesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            favouritesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = favourites[indexPath.item]

        switch item {
        case let .team(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamDetailsCollectionViewCell.identifier,
                                                             for: indexPath) as? TeamDetailsCollectionViewCell {
                cell.set(model)
                return cell
            }
        case let .schedule(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleDetailsCollectionViewCell.identifier,
                                                             for: indexPath) as? ScheduleDetailsCollectionViewCell {
                cell.set(model)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frame = collectionView.frame
        let widthCell = frame.width - CGFloat(20)
        let heightCell = CGFloat(140)
        return CGSize(width: widthCell, height: heightCell)
    }
    
    func set(_ data: FavouritesDataManager) {
        favouritesDataManager = data
    }
}
