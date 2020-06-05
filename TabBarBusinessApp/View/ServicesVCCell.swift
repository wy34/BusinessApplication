//
//  ServiceCell.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class ServicesVCCell: UITableViewCell {
    // MARK: - Properties
    private let cellBackgroundImage = BasicImageView(withImage: #imageLiteral(resourceName: "Background"), withContentMode: .scaleAspectFill)
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func setupCellUI() {
        addSubview(cellBackgroundImage)
        cellBackgroundImage.anchor(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor)
        
        addSubview(cellLabel)
        cellLabel.anchor(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: leftAnchor)
    }
}
