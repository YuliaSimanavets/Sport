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

    var sportsDataManager: SportsDataManager?
    
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
            self?.sportTypesArray = sportArray
            self?.activityIndicator.stopAnimating()
            self?.typesCollectionView.reloadData()
            self?.generalArray = self?.createGeneralModel(from: self?.sportTypesArray ?? []) ?? []
        }
        
        NSLayoutConstraint.activate([
            generalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
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
        let sportImage = generalArray[indexPath.item].sportImage

        cell.set(SportsTypesViewModel(nameImage: sportImage, typeText: sportName))

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frame = collectionView.frame
        let widthCell = frame.width - CGFloat(20)
        let heightCell = CGFloat(50)
        return CGSize(width: widthCell, height: heightCell)
    }
    
    func set(_ data: SportsDataManager) {
        sportsDataManager = data
    }

    private func createActivityIndicator() {

        activityIndicator.center = self.view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func createGeneralModel(from data: [SportModel]) -> [GeneralSportModel] {
        
        var generalSportModel = [GeneralSportModel]()
        let sportCases = Sport.allCases
        
        for i in 0..<data.count {
            if sportCases[i].rawValue == data[i].sportID {

                generalSportModel.append(GeneralSportModel(sportID: sportCases[i].rawValue,
                                                           sportName: data[i].sportName,
                                                           sportImage: (sportCases[i].image ?? UIImage(systemName: ""))!))
            }
        }
        return generalSportModel
    }
}

