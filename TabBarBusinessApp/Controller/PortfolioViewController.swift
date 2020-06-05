//
//  PortfolioViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/1/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PortfolioCell"

class PortfolioViewController: UIViewController {
    // MARK: - Properties
    private let imageList = ["Image1", "Image2", "Image3", "Image4", "Image5"]
    
    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundView = UIImageView(image: UIImage(named: "Background"))
        cv.register(PortfolioCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        return cv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        collection.delegate = self
        collection.dataSource = self
    }
    
    // MARK: - Helper
    func configureUI() {
        collection.backgroundColor = .white
        setupNavBar(withTitle: "Portfolio")
        view.addSubview(collection)
        collection.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
    }
}

// MARK: - UICollectionView delegate methods
extension PortfolioViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PortfolioCollectionCell
        cell.cellImage.image = UIImage(named: imageList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width * 0.46
        let height = view.frame.height * 0.20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
