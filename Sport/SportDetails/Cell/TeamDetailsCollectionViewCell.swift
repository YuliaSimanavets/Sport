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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = CGFloat(10)
        
        contentView.addSubview(stackView)
        contentView.addSubview(teamMascotLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            teamMascotLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            teamMascotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func set(_ data: TeamDetailsViewModel) {
        
        teamAbbreviationLabel.text = data.teamAbbreviation
        teamNameLabel.text = data.teamName
        teamMascotLabel.text = data.teamMascot
        teamRecordLabel.text = data.teamRecord
    }
}
