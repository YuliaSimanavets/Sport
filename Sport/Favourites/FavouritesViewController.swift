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
    
    private enum FavouritesCellType {
        case team(FavouritesTeamViewModel)
        case schedule(FavouritesScheduleViewModel)
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

    private var teams = [TeamFavouritesModel]()
    private var schedules = [ScheduleFavouritesModel]()
    
    private var favourites = [FavouritesCellType]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getFavourites()
        favouritesCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.addSubview(favouritesCollectionView)
        favouritesCollectionView.delegate = self
        favouritesCollectionView.dataSource = self
        
        favouritesCollectionView.register(FavouritesTeamsCollectionViewCell.self,
                                          forCellWithReuseIdentifier: FavouritesTeamsCollectionViewCell.identifier)
        favouritesCollectionView.register(FavouritesScheduleCollectionViewCell.self,
                                          forCellWithReuseIdentifier: FavouritesScheduleCollectionViewCell.identifier)

        getFavourites()
        
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
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouritesTeamsCollectionViewCell.identifier,
                                                             for: indexPath) as? FavouritesTeamsCollectionViewCell {
                cell.set(model)
                cell.closureDeleteButton = { [weak self] in
                    self?.didTapButton(selectedIndex: indexPath)
                }
                return cell
            }
        case let .schedule(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouritesScheduleCollectionViewCell.identifier,
                                                             for: indexPath) as? FavouritesScheduleCollectionViewCell {
                cell.set(model)
                cell.closureDeleteButton = { [weak self] in
                    self?.didTapButton(selectedIndex: indexPath)
                }
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frame = collectionView.frame
        let widthCell = frame.width - CGFloat(20)
        let heightCell = CGFloat(40)
        return CGSize(width: widthCell, height: heightCell)
    }
    
    private func getFavourites() {
        
        teams = favouritesDataManager?.getTeams() ?? []
        schedules = favouritesDataManager?.getSchedule() ?? []
        
        favourites = teams.map { .team(.init(name: $0.name, record: $0.record, id: $0.id)) }
                   + schedules.map { .schedule(.init(homeTeam: $0.homeTeam, dateEvent: $0.dateEvent, id: $0.id)) }
        
        favouritesCollectionView.reloadData()
    }
    
    func set(_ data: FavouritesDataManager) {
        favouritesDataManager = data
    }

    private func didTapButton(selectedIndex: IndexPath) {
        
        let item = favourites[selectedIndex.item]
        
        switch item {
        case let .team(model):
            favouritesDataManager?.removeTeam(with: model.id)
        case let .schedule(model):
            favouritesDataManager?.removeSchedule(with: model.id)
        }
    }
}
