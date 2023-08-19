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

struct TeamDetailsViewModel: Hashable {
    let abbreviation: String
    let name: String
    let mascot: String
    let record: String
    let teamID: Int
    
//    var favoriteStatus: Bool
}

class TeamDetailsCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: TeamDetailsCollectionViewCell.self)
    }
    
    private struct Sizes {
        static let topBottomOffset: CGFloat = 15
        static let leadingOffset: CGFloat = 20
        static let trailingOffset: CGFloat = 20
        static let stackViewSpasing: CGFloat = 10
        static let heightText: CGFloat = 18
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
    
    private let favouritesAddButton: UIButton = {
        let addButton = UIButton()
        addButton.tintColor = .systemPink
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()

    var likesAction: (() -> Void)?
     
    override func setupView() {
        super.setupView()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        let stackView = UIStackView(arrangedSubviews: [teamAbbreviationLabel, teamNameLabel, teamRecordLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Sizes.stackViewSpasing
        
        contentView.addSubview(stackView)
        contentView.addSubview(teamMascotLabel)
        contentView.addSubview(favouritesAddButton)
        
        favouritesAddButton.addTarget(self, action: #selector(tapToFavouritesAction), for: .touchUpInside)
//        favouritesAddButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favouritesAddButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        NSLayoutConstraint.activate([
            favouritesAddButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Sizes.topBottomOffset),
            favouritesAddButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.trailingOffset),
            favouritesAddButton.widthAnchor.constraint(equalToConstant: 25),
            favouritesAddButton.heightAnchor.constraint(equalToConstant: 25),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Sizes.topBottomOffset),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.leadingOffset),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.trailingOffset),
            
            teamMascotLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            teamMascotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.trailingOffset)
        ])
    }
    
    func set(_ data: TeamDetailsViewModel) {
        
        teamAbbreviationLabel.text = data.abbreviation
        teamNameLabel.text = data.name
        teamMascotLabel.text = data.mascot
        teamRecordLabel.text = data.record
        
//        favouritesAddButton.tintColor = data.favoriteStatus ? .systemRed : .lightGray
    }
    
    @objc
    func tapToFavouritesAction() {
        
        likesAction?()
    }
    
//    static func size(for data: TeamDetailsViewModel, containerSize: CGSize) -> CGSize {
//        var height = Sizes.topBottomOffset * 2 + Sizes.heightText * 4 + Sizes.stackViewSpasing * 3
//        return .init(width: containerSize.width, height: height)
//    }
}
