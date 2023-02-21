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
    let dateEvent: Date
    let eventLocation: String
    let homeTeam: String
    let leagueName: String
}

class ScheduleDetailsCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: ScheduleDetailsCollectionViewCell.self)
    }

    private let dateEventLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateFormatter: DateFormatter = {
        let date = DateFormatter()
        date.dateFormat = "MMM d, h:mm a"
        return date
    }()
    
    private let eventLocationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leagueNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        super.setupView()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        let stackView = UIStackView(arrangedSubviews: [dateEventLabel, eventLocationLabel, homeTeamLabel, leagueNameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = CGFloat(10)
        stackView.alignment = .center
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func set(_ data: ScheduleDetailsViewModel) {
        
        dateEventLabel.text = dateFormatter.string(from: data.dateEvent)
        eventLocationLabel.text = data.eventLocation
        homeTeamLabel.text = data.homeTeam
        leagueNameLabel.text = data.leagueName
    }
}
