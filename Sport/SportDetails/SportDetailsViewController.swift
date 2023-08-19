//
//  SportDetailsViewController.swift
//  Sport
//
//  Created by Yuliya on 08/02/2023.
//

import UIKit

class SportDetailsViewController:  UIViewController,
                                   UICollectionViewDelegate,
                                   UICollectionViewDataSource,
                                   UICollectionViewDelegateFlowLayout {
   
    private enum CellType {
        case team(TeamDetailsViewModel)
        case schedule(ScheduleDetailsViewModel)
    }
        
    var sportsDataManager: SportsDataManager?
    private var sportID: Int = 0
    private var titleName: String = "Details"
    
    var favouritesDataManager: FavouritesDataManager?

    private let activityIndicator = UIActivityIndicatorView()
    private let dispatchGroup = DispatchGroup()
    
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Teams", "Schedule"])
        control.selectedSegmentIndex = 0
        control.backgroundColor = .clear
        control.selectedSegmentTintColor = .tabBarItemLight
        control.tintColor = .white
        
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private let detailsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var teams = [TeamModel]()
    private var schedules = [ScheduleModel]()
        
    private lazy var itemsToDisplay: [CellType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .backViewControllers
        view.addSubview(segmentedControl)
        view.addSubview(detailsCollectionView)
        
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
        
        detailsCollectionView.register(TeamDetailsCollectionViewCell.self,
                                       forCellWithReuseIdentifier: TeamDetailsCollectionViewCell.identifier)
        detailsCollectionView.register(ScheduleDetailsCollectionViewCell.self,
                                       forCellWithReuseIdentifier: ScheduleDetailsCollectionViewCell.identifier)
        
        createActivityIndicator()
        
        title = titleName
        
        segmentedControl.addTarget(self,
                                   action: #selector(handleSegmentControl),
                                   for: .valueChanged)
        
        getTeams()
        getSchedule()
        
        dispatchGroup.notify(queue: .main) {
            self.detailsCollectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            detailsCollectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            detailsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
// MARK: - Methods for cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = itemsToDisplay[indexPath.item]

        switch item {
        case let .team(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamDetailsCollectionViewCell.identifier,
                                                             for: indexPath) as? TeamDetailsCollectionViewCell {
                cell.set(model)
                cell.likesAction = { [weak self] in
                    self?.addToFavourites(selectedIndex: indexPath)
                }
                return cell
            }
        case let .schedule(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleDetailsCollectionViewCell.identifier,
                                                             for: indexPath) as? ScheduleDetailsCollectionViewCell {
                cell.set(model)
                cell.likesAction = { [weak self] in
                    self?.addToFavourites(selectedIndex: indexPath)
                }
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
    
// MARK: - setData methods
    func set(_ data: SportsDataManager?) {
        sportsDataManager = data
    }
    
    func setSportIdAndName(sportID: Int, title: String) {
        self.sportID = sportID
        self.titleName = title
    }
    
    func setFavourites(_ data: FavouritesDataManager?) {
        favouritesDataManager = data
    }
    
    @objc
    func handleSegmentControl() {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            itemsToDisplay = teams.map({ TeamDetailsViewModel(abbreviation: $0.abbreviation,
                                                              name: $0.name,
                                                              mascot: $0.mascot,
                                                              record: $0.record,
                                                              teamID: $0.teamID)
            }).map({ .team($0) })
            detailsCollectionView.reloadData()
        case 1:
            itemsToDisplay = schedules.map({ ScheduleDetailsViewModel(dateEvent: $0.dateEvent,
                                                                      eventLocation: $0.eventLocation,
                                                                      homeTeam: $0.homeTeam,
                                                                      leagueName: $0.leagueName,
                                                                      sportID: $0.sportID)
            }).map({ .schedule($0) })
            detailsCollectionView.reloadData()
        default:
            itemsToDisplay = teams.map({ TeamDetailsViewModel(abbreviation: $0.abbreviation,
                                                              name: $0.name,
                                                              mascot: $0.mascot,
                                                              record: $0.record,
                                                              teamID: $0.teamID)
            }).map({ .team($0) })
            detailsCollectionView.reloadData()
        }
    }

    private func createActivityIndicator() {

        activityIndicator.center = self.view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.color = .black
        activityIndicator.style = .medium
    }

    private func getTeams() {
        
        dispatchGroup.enter()
        sportsDataManager?.getTeam(sportId: sportID) { [weak self] teamArray in
            guard let self else { return }
            self.teams = teamArray
            
            self.itemsToDisplay = teamArray.map({ TeamDetailsViewModel(abbreviation: $0.abbreviation,
                                                                       name: $0.name,
                                                                       mascot: $0.mascot,
                                                                       record: $0.record,
                                                                       teamID: $0.teamID)
            }).map({ .team($0) })
            
            self.dispatchGroup.leave()
        }
    }

    private func getSchedule() {
        
        dispatchGroup.enter()
        sportsDataManager?.getSchedule(sportId: sportID, limit: 20) { [weak self] schedulesArray in
            guard let self else { return }
            self.schedules = schedulesArray
            
            self.itemsToDisplay = schedulesArray.map({ ScheduleDetailsViewModel(dateEvent: $0.dateEvent,
                                                                                eventLocation: $0.eventLocation,
                                                                                homeTeam: $0.homeTeam,
                                                                                leagueName: $0.leagueName,
                                                                                sportID: $0.sportID)
            }).map({ .schedule($0) })
            
            self.dispatchGroup.leave()
        }
    }
    
    private func addToFavourites(selectedIndex: IndexPath) {
        
        let item = itemsToDisplay[selectedIndex.item]
        
        switch item {
        case let .team(model):
            favouritesDataManager?.addTeam(TeamFavouritesModel(name: model.name, record: model.record, id: model.teamID))
        case let .schedule(model):
            favouritesDataManager?.addSchedule(ScheduleFavouritesModel(homeTeam: model.homeTeam, dateEvent: model.dateEvent, id: model.sportID))
        }

        let alertController = UIAlertController(title: title, message: "successfully added to favorites ⭐️", preferredStyle: .alert)
//        let alertController = UIAlertController(title: "Something was wrong :(", message: "Please, try again later", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
