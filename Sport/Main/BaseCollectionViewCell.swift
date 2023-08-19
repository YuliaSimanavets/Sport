//
//  BaseCollectionViewCell.swift
//  Sport
//
//  Created by Yuliya on 21/01/2023.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    init() {
        super.init(frame: .zero)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {}
}
