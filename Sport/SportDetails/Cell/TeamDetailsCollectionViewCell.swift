//
//  DetailsCollectionViewCell.swift
//  Sport
//
//  Created by Yuliya on 08/02/2023.
//

import UIKit

/* "Team":  "abbreviation": "AFC"
            "name": "National Football Conference"
            "mascot": "Wildcats"
            "record": "7-4"
 */

struct TeamDetailsViewModel {
    let teamAbbreviation: String
    let teamName: String
    let teamMascot: String
    let teamRecord: String
}

class TeamDetailsCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: TeamDetailsCollectionViewCell.self)
    }
    
    private let teamAbbreviationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let teamMascotLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let teamRecordLabel: UILabel = {
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
        
        let stackView = UIStackView(arrangedSubviews: [teamAbbreviationLabel, teamNameLabel, teamRecordLabel])

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        contentView.addSubview(teamAbbreviationLabel)
//        contentView.addSubview(teamNameLabel)
        contentView.addSubview(teamMascotLabel)
//        contentView.addSubview(teamRecordLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            teamMascotLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            teamMascotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
            
//            teamAbbreviationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            teamAbbreviationLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
////            teamAbbreviationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//
//            teamNameLabel.topAnchor.constraint(equalTo: teamAbbreviationLabel.bottomAnchor, constant: 10),
//            teamNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
////            teamNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//
//            teamRecordLabel.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 10),
//            teamRecordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//
//            teamMascotLabel.centerYAnchor.constraint(equalTo: teamAbbreviationLabel.centerYAnchor, constant: -10),
//            teamMascotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func set(_ data: TeamDetailsViewModel) {
        
        teamAbbreviationLabel.text = data.teamAbbreviation
        teamNameLabel.text = data.teamName
        teamMascotLabel.text = data.teamMascot
        teamRecordLabel.text = data.teamRecord
    }
}
