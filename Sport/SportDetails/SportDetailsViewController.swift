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
    
    private let activityIndicator = UIActivityIndicatorView()
    
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
        
        title = "Details"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(closeVCAction))
        
        segmentedControl.addTarget(self,
                                   action: #selector(handleSegmentControl),
                                   for: .valueChanged)
        
        let group = DispatchGroup()
        
        DispatchQueue.main.async(group: group) {
            self.getTeams()
        }
        DispatchQueue.main.async(group: group) {
            self.getSchedule()
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
        
    func set(_ data: SportsDataManager) {
        sportsDataManager = data
    }
    
    @objc
    func handleSegmentControl() {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            itemsToDisplay = teams.map({ TeamDetailsViewModel(abbreviation: $0.abbreviation,
                                                                        name: $0.name,
                                                                        mascot: $0.mascot,
                                                                        record: $0.record)
            }).map({ .team($0) })
            detailsCollectionView.reloadData()
        case 1:
            itemsToDisplay = schedules.map({ ScheduleDetailsViewModel(dateEvent: $0.dateEvent,
                                                                                eventLocation: $0.eventLocation,
                                                                                homeTeam: $0.homeTeam,
                                                                                leagueName: $0.leagueName)
            }).map({ .schedule($0) })
            detailsCollectionView.reloadData()
        default:
            itemsToDisplay = teams.map({ TeamDetailsViewModel(abbreviation: $0.abbreviation,
                                                                        name: $0.name,
                                                                        mascot: $0.mascot,
                                                                        record: $0.record)
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
    
    @objc
    func closeVCAction() {
        dismiss(animated: true)
    }

    private func getTeams() {
        
        sportsDataManager?.getTeam { [weak self] teamArray in
            guard let self else { return }
            self.teams = teamArray

            self.activityIndicator.stopAnimating()
            self.detailsCollectionView.reloadData()

            self.itemsToDisplay = teamArray.map({ TeamDetailsViewModel(abbreviation: $0.abbreviation,
                                                                        name: $0.name,
                                                                        mascot: $0.mascot,
                                                                        record: $0.record)
            }).map({ .team($0) })
        }
     }
     
     private func getSchedule() {
     
        sportsDataManager?.getSchedule(sportId: 1, limit: 6) { [weak self] schedulesArray in
            guard let self else { return }
            self.schedules = schedulesArray
            self.detailsCollectionView.reloadData()
            self.activityIndicator.stopAnimating()
            
            self.itemsToDisplay = schedulesArray.map({ ScheduleDetailsViewModel(dateEvent: $0.dateEvent,
                                                                                eventLocation: $0.eventLocation,
                                                                                homeTeam: $0.homeTeam,
                                                                                leagueName: $0.leagueName)
            }).map({ .schedule($0) })
        }
    }
}
