//
//  BasicButtonWithTarget.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/1/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class BasicButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(#colorLiteral(red: 0.1646036506, green: 0.3076404333, blue: 0.4737789035, alpha: 1), for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
        backgroundColor = .white
        layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
