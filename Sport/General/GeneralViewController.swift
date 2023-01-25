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
        collectionView.backgroundColor = .systemTeal
        layout.scrollDirection = .vertical
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var sportTypesArray: [SportsTypes] = [
        .ncaaFootball(SportsTypesViewModel(nameImage: UIImage(named: "ncaaFootball"), typeText: "NCAA Football")),
        .nfl(SportsTypesViewModel(nameImage: UIImage(named: "NFL"), typeText: "NFL")),
        .mlb(SportsTypesViewModel(nameImage: UIImage(named: "MLB"), typeText: "MLB")),
        .nba(SportsTypesViewModel(nameImage: UIImage(named: "NBA"), typeText: "NBA")),
        .ncaaMensBasket(SportsTypesViewModel(nameImage: UIImage(named: "NCAAMansBask"), typeText: "NCAA Men's Basketball")),
        .nhl(SportsTypesViewModel(nameImage: UIImage(named: "NHL"), typeText: "NHL")),
        .ufsMma(SportsTypesViewModel(nameImage: UIImage(named: "UFC"), typeText: "UFC/MMA")),
        .wnba(SportsTypesViewModel(nameImage: UIImage(named: "WNBA"), typeText: "WNBA")),
        .mls(SportsTypesViewModel(nameImage: UIImage(named: "MLS"), typeText: "MLS")),
        .epl(SportsTypesViewModel(nameImage: UIImage(named: "EPL"), typeText: "EPL")),
        .fra1(SportsTypesViewModel(nameImage: UIImage(named: ""), typeText: "FRA1")),
        .ger1(SportsTypesViewModel(nameImage: UIImage(named: ""), typeText: "GER1")),
        .esp1(SportsTypesViewModel(nameImage: UIImage(named: ""), typeText: "ESP1")),
        .ita1(SportsTypesViewModel(nameImage: UIImage(named: ""), typeText: "ITA1")),
        .uefaChamp(SportsTypesViewModel(nameImage: UIImage(named: "UEFA"), typeText: "UEFACHAMP")),
        .fifa(SportsTypesViewModel(nameImage: UIImage(named: "FIFA"), typeText: "FIFA"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
        view.addSubview(generalLabel)
        view.addSubview(typesCollectionView)
        
        typesCollectionView.delegate = self
        typesCollectionView.dataSource = self
        
        typesCollectionView.register(SportsTypesCollectionViewCell.self,
                                     forCellWithReuseIdentifier: SportsTypesCollectionViewCell.identifier)
                
        createActivityIndicator()
        
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

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportsTypesCollectionViewCell.identifier, for: indexPath)
        
        let item = sportTypesArray[indexPath.item]
        
        switch item {
        case let .ncaaFootball(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .nfl(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .mlb(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .nba(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .ncaaMensBasket(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .nhl(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .ufsMma(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .wnba(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .mls(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .epl(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .fra1(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .ger1(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .esp1(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .ita1(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .uefaChamp(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        case let .fifa(model):
            if let myCell = cell as? SportsTypesCollectionViewCell {
                myCell.set(model)
                return myCell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        let widthCell = frame.width - CGFloat(20)
        let heightCell = CGFloat(50)
        return CGSize(width: widthCell, height: heightCell)
    }
    
    func set(_ data: SportsDataManager) {
        sportsDataManager = data
    }

    func createActivityIndicator() {

        let activeIndicator = UIActivityIndicatorView(style: .large)
        activeIndicator.center = self.view.center
        
        view.addSubview(activeIndicator)
        activeIndicator.startAnimating()
    }
}

