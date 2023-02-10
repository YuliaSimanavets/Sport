//
//  ScheduleDetailsCollectionViewCell.swift
//  Sport
//
//  Created by Yuliya on 10/02/2023.
//

import UIKit

/* "Schedule":  "date_event": "2023-01-01T18:00:00Z"
                "event_location": "Mercedes-Benz Stadium"
                "home_team": "Atlanta"
                "league_name": "National Football League"
 */

struct ScheduleDetailsViewModel {
    let dateEvent: String
//    let eventLocation: String
    let homeTeam: String
//    let leagueName: String
}

class ScheduleDetailsCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: ScheduleDetailsCollectionViewCell.self)
    }
    
    private let dateEventLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        super.setupView()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(dateEventLabel)
        contentView.addSubview(homeTeamLabel)
        
        NSLayoutConstraint.activate([
            dateEventLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dateEventLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            homeTeamLabel.topAnchor.constraint(equalTo: dateEventLabel.bottomAnchor, constant: 5),
            homeTeamLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    func set(_ data: ScheduleDetailsViewModel) {
        
        dateEventLabel.text = data.dateEvent
        homeTeamLabel.text = data.homeTeam
    }
}
