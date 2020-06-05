//
//  BackgroundImageView.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class BasicImageView: UIImageView {
    init(withImage image: UIImage, withContentMode cm: UIView.ContentMode) {
        super.init(frame: .zero)
        self.image = image
        contentMode = cm
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
