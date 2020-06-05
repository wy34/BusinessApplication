//
//  AboutViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/1/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    // MARK: - Properties
    private let backgroundImage = BasicImageView(withImage: #imageLiteral(resourceName: "Background"), withContentMode: .scaleAspectFill)
    private let logo = BasicImageView(withImage: #imageLiteral(resourceName: "Logo"), withContentMode: .scaleAspectFit)
    
    private lazy var aboutUsTextView: UITextView = {
        return UITextView.createTextView(withText: "asdkfjasdjfak;sdjfka;sdfk;kasdfj;kajfkjasdfkjad;skfjas;dfj;aksdfj;kajdsf;dskja;sdfja;ksdj;kadjs;kadjs;j;skdj;sdfjk;sdjfk;sdjfkdsksdkfksdfksdfksdjksdjfkjsdfkjsdfjsdjfsdjfsdjfsdjfsdkfjksdjfkdjkdjsfsd;jkdsjk", textColor: .white, BGColor: .clear, isEditiable: false)
    }()
    
    private let buttonViewContainer: UIView = {
        let v = UIView()
    
        let button = BasicButton(title: "Contact Us")
        v.addSubview(button)
        button.addTarget(self, action: #selector(contactUsClicked), for: .touchUpInside)
        button.setDimension(height: v.heightAnchor, width: v.widthAnchor, heightMultiplier: 0.7, widthMultiplier: 1)
        button.center(y: v.centerYAnchor)
        
        return v
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        aboutUsTextView.text = "alskfjasjdfalskd;fjaksdjfal;kdfjadklsfaksdfjaksdjfak;sdjfak;sdjfaksdfkasdfadsfkasdfkasfkasdfklasdfkasjdfaksfak;sdjfasdfasdfafada;sdfjjaskdfljaskdfjasdfkasdfkajsdkfjaskfjaksdjfaksdfaklsdjfkasjfdla;sdfjkasdjfkajsdfalskfjasjdfalskd;fjaksdjfal;kdfjadklsfaksdfjaksdjfak;sdjfak;sdjfaksdfkasdfadsfkasdfkasfkasdfklasdfkasjdfaksfak;sdjfasdfasdfafada;sdfjjaskdfljaskdfjasdfkasdfkajsdkfjaskfjaksdjfaksdfaklsdjfkasjfdla;sdfjkasdjfkajsdfalskfjasjdfalskd;fjaksdjfal;kdfjadklsfaksdfjaksdjfak;sdjfak;sdjfaksdfkasdfadsfkasdfkasfkasdfklasdfkasjdfaksfak;sdjfasdfasdfafada;sdfjjaskdfljaskdfjasdfkasdfkajsdkfjaskfjaksdjfaksdfaklsdjfkasjfdla;sdfjkasdjfkajsdf"
    }
    
    // MARK: - Helper
    func configureUI() {
        setupNavBar(withTitle: "About Us")
        addAndAnchorBackgroundImage(backgroundImage)
        
        view.addSubview(logo)
        logo.anchor(top: view.topAnchor, paddingTop: 15)
        logo.center(x: view.centerXAnchor)
        logo.setDimension(height: view.heightAnchor, width: view.widthAnchor, heightMultiplier: 0.3, widthMultiplier: 0.9)
        
        view.addSubview(aboutUsTextView)
        aboutUsTextView.anchor(top: logo.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 10, paddingRight: 15, paddingLeft: 15)
        aboutUsTextView.setDimension(height: view.heightAnchor, heightMultiplier: 0.5)
        
        view.addSubview(buttonViewContainer)
        buttonViewContainer.anchor(top: aboutUsTextView.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingRight: 20, paddingBottom: 20, paddingLeft: 20)
    }
    
    // MARK: - Selectors
    @objc func contactUsClicked() {
        self.tabBarController?.selectedIndex = 4
    }
}
