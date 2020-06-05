//
//  SocialLinksViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/4/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SocialLinkCell"

class SocialLinksViewController: UIViewController {
    // MARK: - Properties
    var socialMedias: [[String: String]]!
    
    private let table: UITableView = {
        let tv = UITableView()
        tv.register(SocialLinkCell.self, forCellReuseIdentifier: reuseIdentifier)
        tv.backgroundView = UIImageView(image: #imageLiteral(resourceName: "Background"))
        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        table.delegate = self
        table.dataSource = self
        socialMedias = loadPlist()
        
//        hidesBottomBarWhenPushed = true
//        
//        self.extendedLayoutIncludesOpaqueBars = true
//        self.edgesForExtendedLayout = UIRectEdge.bottom
    }
    
    // MARK: - Helper
    func configureUI() {
        navigationController?.isToolbarHidden = true
        setupNavBar(withTitle: "Social Links")
        navigationController?.navigationBar.tintColor = .white
        view.addSubview(table)
        table.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
    }
    
    func loadPlist() -> [[String: String]] {
        let path = Bundle.main.path(forResource: "socialList", ofType: "plist")
        return NSArray(contentsOf: URL(fileURLWithPath: path!)) as! [[String: String]]
    }
}

// MARK: - UITableview delegate methods
extension SocialLinksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return socialMedias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SocialLinkCell
        cell.cellImage.image = UIImage(named: socialMedias[indexPath.row]["Image"]!)
        cell.socialTitleLabel.text = socialMedias[indexPath.row]["Title"]!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcToGoTo = SocialSiteViewController()
        vcToGoTo.urlString = socialMedias[indexPath.row]["Url"]!
        navigationController?.pushViewController(vcToGoTo, animated: true)
    }
}
