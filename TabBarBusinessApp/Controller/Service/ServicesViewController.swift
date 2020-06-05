//
//  ServicesViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/1/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ServicesCell"

class ServicesViewController: UIViewController {
    // MARK: - Properties
    private var items = [[String: String]]()
    
    private let table: UITableView = {
        let tv = UITableView()
        tv.register(ServicesVCCell.self, forCellReuseIdentifier: reuseIdentifier)
        tv.backgroundView = UIImageView(image: UIImage(named: "Background"))
        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        items = loadPList()
        table.delegate = self
        table.dataSource = self
    }
    
    // MARK: - Helpers
    func configureUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        setupNavBar(withTitle: "Services")
        view.addSubview(table)
        table.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
    }
    
    func loadPList() -> [[String: String]] {
        let path = Bundle.main.path(forResource: "ServiceList", ofType: "plist")
        return NSArray(contentsOf: URL(fileURLWithPath: path!)) as! [[String: String]]
    }
}

// MARK: - Tableview Delegate Methods
extension ServicesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ServicesVCCell {
            cell.cellLabel.text = items[indexPath.row]["Title"]
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcToGoTo = DetailedViewController()
        vcToGoTo.selectedService = items[indexPath.row]
        navigationController?.pushViewController(vcToGoTo, animated: true)
        
    }
}
