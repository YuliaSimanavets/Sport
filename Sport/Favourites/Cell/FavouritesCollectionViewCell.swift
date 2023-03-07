//
//  FavouritesCollectionViewCell.swift
//  Sport
//
//  Created by Yuliya on 06/03/2023.
//

import UIKit

protocol FavouritesCollectionViewCellDelegate: AnyObject {
    func didTapButton(selectedIndex: Int)
}

struct FavouritesViewModel {
    let name: String
    let record: String
//    let dateEvent: Date
}

class FavouritesCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: FavouritesCollectionViewCell.self)
    }
    var index = 0
    weak var delegate: FavouritesCollectionViewCellDelegate?
    
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
    
    let deleteButton: UIButton = {
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
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, recordLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 50
        
        contentView.addSubview(stackView)
        contentView.addSubview(deleteButton)
        deleteButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            deleteButton.widthAnchor.constraint(equalToConstant: 40),
            deleteButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func set(_ data: FavouritesViewModel) {
        
        nameLabel.text = data.name
        recordLabel.text = data.record
//        dateEventLabel.text = dateFormatter.string(from: data.dateEvent)
    }
    
    @objc
    func deleteAction() {
        delegate?.didTapButton(selectedIndex: index)
    }
}
