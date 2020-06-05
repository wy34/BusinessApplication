//
//  SocialLinkCell.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/4/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class SocialLinkCell: UITableViewCell {
    // MARK: - Properties
    private let backgroundImage = BasicImageView(withImage: #imageLiteral(resourceName: "Background"), withContentMode: .scaleAspectFill)
    let cellImage = BasicImageView(withImage: #imageLiteral(resourceName: "SocialIcon1"), withContentMode: .scaleAspectFill)
    let socialTitleLabel = UILabel.createLabel(withText: "Facebook", withFontSize: 40, withAlignment: .left)
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellImage.layer.cornerRadius = 5
        anchorUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper
    func anchorUIElements() {
        addSubview(backgroundImage)
        backgroundImage.anchor(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor)
        
        addSubview(cellImage)
        cellImage.setDimension(height: heightAnchor, width: widthAnchor, heightMultiplier: 0.85, widthMultiplier: 0.2)
        cellImage.anchor(left: leftAnchor, paddingLeft: 15)
        cellImage.center(y: centerYAnchor)
        
        addSubview(socialTitleLabel)
        socialTitleLabel.anchor(right: rightAnchor, left: cellImage.rightAnchor, paddingRight: 10, paddingLeft: 10)
        socialTitleLabel.center(y: centerYAnchor)
    }
}
