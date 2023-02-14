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
    
    private let teamsAndSchedulesSegmController: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Teams", "Schedule"])
        control.selectedSegmentIndex = 0
        control.backgroundColor = .clear
        control.selectedSegmentTintColor = .tabBarItemLight
        control.tintColor = .white
        control.addTarget(SportDetailsViewController.self, action: #selector(handleSegmentControl), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private let detailsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemYellow
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let teams: [TeamDetailsViewModel] = [
        .init(teamAbbreviation: "ACU", teamName: "Western Athletic Conference", teamMascot: "Wildcats", teamRecord: "7-4"),
        .init(teamAbbreviation: "ADST", teamName: "Rocky Mountain", teamMascot: "Grizzlies", teamRecord: "2-9"),
        .init(teamAbbreviation: "ADR", teamName: "Michigan", teamMascot: "Bulldogs", teamRecord: "6-4"),
        .init(teamAbbreviation: "AIN", teamName: "Aina", teamMascot: "Hulaaina", teamRecord: "5-5-7")
    ]
    
    private let schedules: [ScheduleDetailsViewModel] = [
        .init(dateEvent: "2023-01-01T18:00:00Z", eventLocation: "-", homeTeam: "Atlanta", leagueName: "-"),
        .init(dateEvent: "2023-01-01T18:00:00Z", eventLocation: "-", homeTeam: "New England", leagueName: "-"),
        .init(dateEvent: "2023-01-01T18:00:00Z", eventLocation: "-", homeTeam: "Houston", leagueName: "-"),
        .init(dateEvent: "2023-01-01T18:00:00Z", eventLocation: "-", homeTeam: "Tampa Bay", leagueName: "-")
    ]
    
//    private lazy var itemsToDisplay: [CellType] = teams.map { .team($0) }
    private lazy var itemsToDisplay: [CellType] = schedules.map { .schedule($0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .backViewControllers
        view.addSubview(teamsAndSchedulesSegmController)
        view.addSubview(detailsCollectionView)
        
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
        
        detailsCollectionView.register(TeamDetailsCollectionViewCell.self, forCellWithReuseIdentifier: TeamDetailsCollectionViewCell.identifier)
        detailsCollectionView.register(ScheduleDetailsCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleDetailsCollectionViewCell.identifier)
        
        createActivityIndicator()
        
        title = "Details"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(closeVCAction))
        
//        sportsDataManager?.getTeam(sportId: 1) { teamArray in
//            guard let self else { return }
//            self.itemsToDisplay = teamArray
//            self.detailsCollectionView.reloadData()
//        }
        
        NSLayoutConstraint.activate([
            teamsAndSchedulesSegmController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            teamsAndSchedulesSegmController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            teamsAndSchedulesSegmController.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            detailsCollectionView.topAnchor.constraint(equalTo: teamsAndSchedulesSegmController.bottomAnchor, constant: 20),
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
        let heightCell = CGFloat(120)
        return CGSize(width: widthCell, height: heightCell)
    }
        
    func set(_ data: SportsDataManager) {
        sportsDataManager = data
    }
    
    @objc
    func handleSegmentControl() {
        switch teamsAndSchedulesSegmController.selectedSegmentIndex {
        case 0:
            itemsToDisplay = teams.map({ .team($0) })
        case 1:
            itemsToDisplay = schedules.map({ .schedule($0) })
        default:
            itemsToDisplay = teams.map({ .team($0) })
        }
        detailsCollectionView.reloadData()
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
}

