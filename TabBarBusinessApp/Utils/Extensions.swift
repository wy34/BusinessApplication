//
//  Extensions.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/1/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingRight: CGFloat = 0, paddingBottom: CGFloat = 0, paddingLeft: CGFloat = 0, height: CGFloat? = nil, width: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
    func center(x: NSLayoutXAxisAnchor? = nil, y: NSLayoutYAxisAnchor? = nil, xPadding: CGFloat = 0, yPadding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let x = x {
            centerXAnchor.constraint(equalTo: x, constant: xPadding).isActive = true
        }
        
        if let y = y {
            centerYAnchor.constraint(equalTo: y, constant: yPadding).isActive = true
        }
    }
    
    func setDimension(height: NSLayoutDimension? = nil, width: NSLayoutDimension? = nil, heightMultiplier: CGFloat = 0, widthMultiplier: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier).isActive = true
        }
    }
}

extension UIViewController {
    func setupNavBar(withTitle title: String) {
        navigationController?.navigationBar.isTranslucent = false
        self.title = title
        edgesForExtendedLayout = []
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1646036506, green: 0.3076404333, blue: 0.4737789035, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func addAndAnchorBackgroundImage(_ image: UIImageView) {
        view.addSubview(image)
        image.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
    }
}

extension UITextView {
    static func createTextView(withText text: String = "", textColor: UIColor, BGColor color: UIColor, isEditiable: Bool) -> UITextView {
        let tv = UITextView()
        tv.text = text
        tv.font = UIFont.systemFont(ofSize: 25)
        tv.textColor = textColor
        tv.backgroundColor = color
        tv.isEditable = isEditiable
        tv.layer.cornerRadius = 5
        return tv
    }
}

extension UITextField {
    static func createTextField() -> UITextField {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 5
        return tf
    }
}

extension UILabel {
    static func createLabel(withText text: String, withFontSize font: CGFloat, withAlignment alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: font)
        label.textColor = .white
        label.textAlignment = alignment
        label.minimumScaleFactor = 0.5
        return label
    }
}
