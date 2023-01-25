//
//  SportCollectionViewCell.swift
//  Sport
//
//  Created by Yuliya on 21/01/2023.
//

import UIKit

struct SportsTypesViewModel {
    let nameImage: UIImage?
    let typeText: String
}

class SportsTypesCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: SportsTypesCollectionViewCell.self)
    }
    
    private let sportLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func setupView() {
        super.setupView()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10

        contentView.addSubview(sportLabel)
        contentView.addSubview(sportImageView)
        
        NSLayoutConstraint.activate([
            sportImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            sportImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            sportImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            sportImageView.heightAnchor.constraint(equalToConstant: 50),
            sportImageView.widthAnchor.constraint(equalToConstant: 50),
            
            sportLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            sportLabel.leadingAnchor.constraint(equalTo: sportImageView.trailingAnchor, constant: 20),
            sportLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
    }
    
    func set(_ data: SportsTypesViewModel) {
        sportImageView.image = data.nameImage
        sportLabel.text = data.typeText
    }
}
