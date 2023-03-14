//
//  ViewController.swift
//  Sport
//
//  Created by Yuliya on 18/01/2023.
//

import UIKit

class GeneralViewController: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource,
                             UICollectionViewDelegateFlowLayout {
    
    private var sportsDataManager: SportsDataManager?
    private var favouritesDataManager: FavouritesDataManager?
    
    private let activityIndicator = UIActivityIndicatorView()
    
    private let generalLabel: UILabel = {
        let label = UILabel()
        label.text = "Select sport"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        layout.scrollDirection = .vertical
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var sportTypesArray = [SportModel]()
    private var generalArray = [GeneralSportModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(generalLabel)
        view.addSubview(typesCollectionView)
        
        typesCollectionView.delegate = self
        typesCollectionView.dataSource = self
        
        typesCollectionView.register(SportsTypesCollectionViewCell.self,
                                     forCellWithReuseIdentifier: SportsTypesCollectionViewCell.identifier)
        
        createActivityIndicator()
        
        sportsDataManager?.loadData { [weak self] sportArray in
            guard let self else { return }
            self.sportTypesArray = sportArray
            self.activityIndicator.stopAnimating()
            self.typesCollectionView.reloadData()

            self.generalArray = sportArray.map({ sport in
                if let sportType = Sport(rawValue: sport.sportID) {
                    return GeneralSportModel(sportID: sport.sportID, sportName: sport.sportName, sportType: sportType)
                }
                return nil
            }).compactMap({ $0 })
        }
        
        NSLayoutConstraint.activate([
            generalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            generalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            typesCollectionView.topAnchor.constraint(equalTo: generalLabel.topAnchor, constant: 50),
            typesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            typesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            typesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportTypesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportsTypesCollectionViewCell.identifier,
                                                            for: indexPath)as? SportsTypesCollectionViewCell
        else { return UICollectionViewCell() }
        
        let sportName = generalArray[indexPath.item].sportName
        let sportImage = generalArray[indexPath.item].image
        
        cell.set(SportsTypesViewModel(nameImage: sportImage, typeText: sportName))
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        tapAction(selectedIndex: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frame = collectionView.frame
        let widthCell = frame.width - CGFloat(20)
        let heightCell = CGFloat(50)
        return CGSize(width: widthCell, height: heightCell)
    }
    
    func set(_ dataSport: SportsDataManager, _ dataFavourites: FavouritesDataManager) {
        sportsDataManager = dataSport
        favouritesDataManager = dataFavourites
    }

    private func createActivityIndicator() {

        activityIndicator.center = self.view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    @objc
    func tapAction(selectedIndex: IndexPath) {
        
        let sportID = generalArray[selectedIndex.item].sportID
        let sportName = generalArray[selectedIndex.item].sportName
        
        let detailsVC = SportDetailsViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
                
        detailsVC.setSportIdAndName(sportID: sportID, title: sportName)
        detailsVC.set(sportsDataManager)
        detailsVC.setFavourites(favouritesDataManager)
    }
}
