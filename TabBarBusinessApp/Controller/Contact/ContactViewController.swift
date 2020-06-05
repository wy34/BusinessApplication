//
//  ContactViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/1/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit
import MapKit

class ContactViewController: UIViewController {
    // MARK: - Properties
    var latitude = 51.50137
    var longitude = -0.1419
    
    private let mapView: MKMapView = {
        let mv = MKMapView()
        mv.mapType = .standard
        mv.isZoomEnabled = true
        mv.isScrollEnabled = true
        return mv
    }()
    
    private let backgroundImage = BasicImageView(withImage: #imageLiteral(resourceName: "Background"), withContentMode: .scaleAspectFill)
    private let addressLabel = UILabel.createLabel(withText: "123 Street, London, United Kingdom", withFontSize: 20, withAlignment: .center)
    
    private let directionBtn: BasicButton = {
        let button = BasicButton(title: "Directions")
        button.addTarget(self, action: #selector(directionsClicked), for: .touchUpInside)
        return button
    }()
    
    private let callUsBtn: BasicButton = {
        let button = BasicButton(title: "Call Us")
        button.addTarget(self, action: #selector(callUsClicked), for: .touchUpInside)
        return button
    }()
    
    private let emailUsBtn: BasicButton = {
        let button = BasicButton(title: "Email Us")
        button.addTarget(self, action: #selector(emailUsClicked), for: .touchUpInside)
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
        configureMap()
    }
    
    // MARK: - Helper
    func configureUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.addSubview(backgroundImage)
        backgroundImage.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
        
        setupNavBar(withTitle: "Contact Us")
        view.addSubview(mapView)
        mapView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor)
        mapView.setDimension(height: view.heightAnchor, heightMultiplier: 0.5)
        
        view.addSubview(addressLabel)
        addressLabel.anchor(top: mapView.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor)
        addressLabel.setDimension(height: view.heightAnchor, heightMultiplier: 0.12)
        
        let buttonStack = UIStackView(arrangedSubviews: [directionBtn, callUsBtn, emailUsBtn, socialLinksBtn])
        buttonStack.axis = .vertical
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 8
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonStack)
        buttonStack.anchor(top: addressLabel.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 20, paddingBottom: 20, paddingLeft: 20)
    }
    
    func configureMap() {
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: span)
        mapView.setRegion(region, animated: true)
        
        let pinAnn = MKPointAnnotation()
        pinAnn.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        pinAnn.title = "My Company"
        pinAnn.subtitle = "123 Street, London, United Kingdom"
        mapView.addAnnotation(pinAnn)
    }
    
    // MARK: - Selectors
    @objc func directionsClicked() {
        UIApplication.shared.open(URL(string: "https://maps.apple.com/maps?daddr=\(latitude),\(longitude)")!, options: [:], completionHandler: nil)
    }
    
    @objc func callUsClicked() {
        UIApplication.shared.open(URL(string: "tel://123456789")!, options: [:], completionHandler: nil)
    }
    
    @objc func emailUsClicked() {
        let screenToGoTo = EmailViewController()
        navigationController?.pushViewController(screenToGoTo, animated: true)
    }
    
    @objc func socialLinksClicked() {
        let vcToGoTo = SocialLinksViewController()
        navigationController?.pushViewController(vcToGoTo, animated: true)
    }
}



