//
//  HomeViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/1/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    private let backgroundImage = BasicImageView(withImage: #imageLiteral(resourceName: "Background"), withContentMode: .scaleAspectFill)
    
    private let logo = BasicImageView(withImage: #imageLiteral(resourceName: "Logo"), withContentMode: .scaleAspectFit)
    
    private let servicesBtn: BasicButton = {
        let button = BasicButton(title: "Services")
        button.addTarget(self, action: #selector(servicesClicked), for: .touchUpInside)
        return button
    }()
    
    private let portfolioBtn: BasicButton = {
        let button = BasicButton(title: "Portfolio")
        button.addTarget(self, action: #selector(portfolioClicked), for: .touchUpInside)
        return button
    }()
    
    private let aboutUsBtn: BasicButton = {
        let button = BasicButton(title: "About Us")
        button.addTarget(self, action: #selector(aboutUsClicked), for: .touchUpInside)
        return button
    }()
    
    private let contactUsBtn: BasicButton = {
        let button = BasicButton(title: "Contact Us")
        button.addTarget(self, action: #selector(contactUsClicked), for: .touchUpInside)
        return button
    }()
   
    private let socialLinksBtn: BasicButton = {
        let button = BasicButton(title: "Social Links")
        button.addTarget(self, action: #selector(socialLinksClicked), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI() {
        setupNavBar(withTitle: "Home")
        addAndAnchorBackgroundImage(backgroundImage)
        
        view.addSubview(logo)
        logo.anchor(top: view.topAnchor, paddingTop: 20)
        logo.center(x: view.centerXAnchor)
        logo.setDimension(height: view.heightAnchor, width: view.widthAnchor, heightMultiplier: 0.5, widthMultiplier: 0.9)
        
        let buttonStack = UIStackView(arrangedSubviews: [servicesBtn, portfolioBtn, aboutUsBtn, contactUsBtn, socialLinksBtn])
        buttonStack.axis = .vertical
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 8
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonStack)
        buttonStack.anchor(top: logo.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingRight: 20, paddingBottom: 20, paddingLeft: 20)
    }
    
    // MARK: - Selector
    @objc func servicesClicked() {
        self.tabBarController?.selectedIndex = 2
    }
    
    @objc func portfolioClicked() {
        self.tabBarController?.selectedIndex = 3
    }
    
    @objc func aboutUsClicked() {
        self.tabBarController?.selectedIndex = 1
    }
    
    @objc func contactUsClicked() {
        self.tabBarController?.selectedIndex = 4
    }
    
    @objc func socialLinksClicked() {
        let vcToGoTo = SocialLinksViewController()
        navigationController?.pushViewController(vcToGoTo, animated: true)
    }
}
