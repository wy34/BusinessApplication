//
//  EmailViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/3/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit
import MessageUI

class EmailViewController: UIViewController {
    // MARK: - Properties
    private let backgroundImage = BasicImageView(withImage: #imageLiteral(resourceName: "Background"), withContentMode: .scaleAspectFill)
    private let nameLabel = UILabel.createLabel(withText: "Name:", withFontSize: 20, withAlignment: .left)
    private let nameField = UITextField.createTextField()
    private let emailLabel = UILabel.createLabel(withText: "Email:", withFontSize: 20, withAlignment: .left)
    private let emailField = UITextField.createTextField()
    private let messageLabel = UILabel.createLabel(withText: "Message", withFontSize: 20, withAlignment: .left)
    private let messageTextView = UITextView.createTextView(textColor: .black, BGColor: .white, isEditiable: true)
    
    private let sendButton: BasicButton = {
        let button = BasicButton(title: "Send")
        button.addTarget(self, action: #selector(sendClicked), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        nameField.delegate = self
        emailField.delegate = self
        messageTextView.delegate = self
        
        nameField.returnKeyType = UIReturnKeyType.done
        emailField.returnKeyType = UIReturnKeyType.done
        messageTextView.returnKeyType = UIReturnKeyType.done
    }
    
    // MARK: - Helper
    func configureUI() {
        navigationController?.navigationBar.tintColor = .white
        setupNavBar(withTitle: "Email Us")
        
        view.addSubview(backgroundImage)
        backgroundImage.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
        
        let labelTextFieldStack = UIStackView(arrangedSubviews: [nameLabel, nameField, emailLabel, emailField, messageLabel])
        labelTextFieldStack.axis = .vertical
        labelTextFieldStack.spacing = 10
        labelTextFieldStack.distribution = .fillEqually
        labelTextFieldStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelTextFieldStack)
        labelTextFieldStack.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingRight: 15, paddingLeft: 15)
        labelTextFieldStack.setDimension(height: view.heightAnchor, heightMultiplier: 0.3)
        
        view.addSubview(messageTextView)
        messageTextView.anchor(top: labelTextFieldStack.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 10, paddingRight: 15, paddingLeft: 15)
        messageTextView.setDimension(height: view.heightAnchor, heightMultiplier: 0.15)
        
        view.addSubview(sendButton)
        sendButton.anchor(top: messageTextView.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 10, paddingRight: 15, paddingLeft: 15)
        sendButton.setDimension(height: view.heightAnchor, heightMultiplier: 0.05)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Selector
    @objc func sendClicked() {
        let mcvc = MFMailComposeViewController()
        mcvc.mailComposeDelegate = self
        let recipients = ["123@gmail.com"]
        mcvc.setToRecipients(recipients)
        mcvc.setSubject(nameField.text! + " - my app")
        mcvc.setMessageBody("""
                            Name: \(nameField.text!)
                            Email: \(emailField.text!)
                            Message: \(messageTextView.text!)
                           """, isHTML: false)
        self.present(mcvc, animated: true, completion: nil)
    }
}


// MARK: - UITextfield Delegate methods
extension EmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UITextView delegate methods
extension EmailViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

// MARK: - MFMailComposer delegate methods
extension EmailViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
