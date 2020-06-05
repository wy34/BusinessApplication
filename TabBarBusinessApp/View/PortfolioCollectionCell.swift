//
//  PortfolioCollectionCell.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class PortfolioCollectionCell: UICollectionViewCell {
    // MARK: - Properties
    let cellImage = BasicImageView(withImage: #imageLiteral(resourceName: "Image4"), withContentMode: .scaleAspectFill)
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helper
    func setupCellUI() {
        cellImage.layer.borderWidth = 5
        cellImage.layer.borderColor = UIColor.white.cgColor
        addSubview(cellImage)
        cellImage.anchor(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor)
    }
}
