//
//  ViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/1/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class TabBarController: UIViewController {
    // MARK: - Properties
    private let tabBar: UITabBarController = {
        let tb = UITabBarController()
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "Tab1.pdf"), tag: 0)
        
        let aboutVC = UINavigationController(rootViewController: AboutViewController())
        aboutVC.tabBarItem = UITabBarItem(title: "About Us", image: #imageLiteral(resourceName: "Tab2"), tag: 1)
        
        let servicesVC = UINavigationController(rootViewController: ServicesViewController())
        servicesVC.tabBarItem = UITabBarItem(title: "Services", image: #imageLiteral(resourceName: "Tab5"), tag: 2)
        
        let portfolioVC = UINavigationController(rootViewController: PortfolioViewController())
        portfolioVC.tabBarItem = UITabBarItem(title: "Portfolio", image: #imageLiteral(resourceName: "Tab4"), tag: 3)
        
        let contactVC = UINavigationController(rootViewController: ContactViewController())
        contactVC.tabBarItem = UITabBarItem(title: "Contact Us", image: #imageLiteral(resourceName: "Tab5"), tag: 4)
        
        tb.viewControllers = [homeVC, aboutVC, servicesVC, portfolioVC, contactVC]
        
        return tb
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabBar.view)
        tabBar.tabBar.isTranslucent = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

