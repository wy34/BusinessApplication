//
//  DetailedViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    // MARK: - Properties
    var selectedService: [String: String]?
    private let backgroundImage = BasicImageView(withImage: #imageLiteral(resourceName: "Background"), withContentMode: .scaleAspectFill)
    private let detailedServiceImage = BasicImageView(withImage: #imageLiteral(resourceName: "Image1"), withContentMode: .scaleAspectFill)
    
    private let detailedServiceLabel = UILabel.createLabel(withText: "Label", withFontSize: 30, withAlignment: .center)
    
    private lazy var detailedTextView: UITextView = {
        return UITextView.createTextView(textColor: .white, BGColor: .clear, isEditiable: false)
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBaseUI()
        setupSelectedDataToUI()
    }
    
    // MARK: - Helper
    func configureBaseUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        
        view.addSubview(backgroundImage)
        backgroundImage.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
        
        view.addSubview(detailedServiceImage)
        detailedServiceImage.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor)
        detailedServiceImage.setDimension(height: view.heightAnchor, heightMultiplier: 0.4)

        view.addSubview(detailedServiceLabel)
        detailedServiceLabel.anchor(top: detailedServiceImage.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor)
        detailedServiceLabel.setDimension(height: view.heightAnchor, heightMultiplier: 0.13)
        
        view.addSubview(detailedTextView)
        detailedTextView.anchor(top: detailedServiceLabel.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingTop: 7, paddingRight: 7, paddingBottom: 7, paddingLeft: 7)
    }
    
    func setupSelectedDataToUI() {
        if let selectedService = selectedService {
            title = selectedService["Title"]
            detailedServiceLabel.text = selectedService["Title"]
            detailedServiceImage.image = UIImage(named: selectedService["Image"]!)
            detailedTextView.text = selectedService["Description"]
        }
    }
}
