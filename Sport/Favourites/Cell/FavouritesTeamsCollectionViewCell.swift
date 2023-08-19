//
//  FavouritesTeamsCollectionViewCell.swift
//  Sport
//
//  Created by Yuliya on 06/03/2023.
//

import UIKit

struct FavouritesTeamViewModel {
    let name: String
    let record: String
    let id: Int
}

class FavouritesTeamsCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: FavouritesTeamsCollectionViewCell.self)
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let recordLabel: UILabel = {
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
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(recordLabel)
        contentView.addSubview(deleteButton)
        deleteButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            recordLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20),
            recordLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            recordLabel.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10),
            
            deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            deleteButton.widthAnchor.constraint(equalToConstant: 40),
            deleteButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func set(_ data: FavouritesTeamViewModel) {
        
        nameLabel.text = data.name
        recordLabel.text = data.record
    }
    
    var closureDeleteButton: (() -> Void)?
        
    @objc
    func deleteAction() {
        
        closureDeleteButton?()
    }
}
