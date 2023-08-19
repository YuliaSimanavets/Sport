//
//  FavouritesScheduleCollectionViewCell.swift
//  Sport
//
//  Created by Yuliya on 08/03/2023.
//

import UIKit

struct FavouritesScheduleViewModel {
    let homeTeam: String
    let dateEvent: Date
    let id: Int
}

class FavouritesScheduleCollectionViewCell: BaseCollectionViewCell {

    static var identifier: String {
        return String(describing: FavouritesScheduleCollectionViewCell.self)
    }
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash.circle"), for: .normal)
        button.setImage(UIImage(systemName: "trash.circle.fill"), for: .highlighted)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
    
    override func setupView() {
        super.setupView()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(homeTeamLabel)
        contentView.addSubview(dateEventLabel)
        contentView.addSubview(deleteButton)
        deleteButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            homeTeamLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            homeTeamLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            homeTeamLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -10),
            
            dateEventLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateEventLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateEventLabel.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10),
            
            deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            deleteButton.widthAnchor.constraint(equalToConstant: 40),
            deleteButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func set(_ data: FavouritesScheduleViewModel) {
        
        homeTeamLabel.text = data.homeTeam
        dateEventLabel.text = dateFormatter.string(from: data.dateEvent)
    }

    var closureDeleteButton: (() -> Void)?
    
    @objc
    func deleteAction() {
        
        closureDeleteButton?()
    }
}
