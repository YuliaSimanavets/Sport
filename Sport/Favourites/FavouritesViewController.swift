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
        case cshedule(ScheduleDetailsViewModel)
    }
    
    //    private var favourites = [CellType]()
    
    private var favouritesDataManager: FavouritesDataManager?
    
    private let favouritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemYellow
        layout.scrollDirection = .vertical
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var favouritesTeams = [TeamDetailsViewModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favouritesTeams = favouritesDataManager?.getData() ?? []
        
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
        
        favouritesTeams = favouritesDataManager?.getData() ?? []
        
        NSLayoutConstraint.activate([
            favouritesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favouritesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            favouritesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            favouritesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favouritesTeams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamDetailsCollectionViewCell.identifier, for: indexPath)
                
        if let myCell = cell as? TeamDetailsCollectionViewCell {
            let item = favouritesTeams[indexPath.item]
            myCell.set(item)
            return cell
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
