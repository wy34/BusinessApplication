//
//  SocialSiteViewController.swift
//  TabBarBusinessApp
//
//  Created by William Yeung on 6/4/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit
import WebKit

class SocialSiteViewController: UIViewController, WKNavigationDelegate {
    // MARK: - Properties
    var webView: WKWebView!
    var urlString: String!
    
    private let actIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .large
        return ai
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        webView = WKWebView()
        view = webView
        webView.navigationDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
        //configureToolBar()
    }

    // MARK: - Helper
    func configureWebView() {
        view.addSubview(actIndicator)
        actIndicator.center(x: view.centerXAnchor, y: view.centerYAnchor)
        actIndicator.anchor(height: 20, width: 20)
        
        guard let urlString = urlString else { return }
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
    
    func configureToolBar() {
        navigationController?.isToolbarHidden = false
        let refresh = UIBarButtonItem(title: "Refresh", style: .plain, target: webView, action: #selector(webView.reload))
        let stop = UIBarButtonItem(title: "Stop", style: .plain, target: webView, action: #selector(webView.stopLoading))
        let back = UIBarButtonItem(title: "Back", style: .plain, target: webView, action: #selector(webView.goBack))
        let forward = UIBarButtonItem(title: "Forward", style: .plain, target: webView, action: #selector(webView.goForward))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbarItems = [refresh, stop, space, back, forward]
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        actIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        actIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        actIndicator.stopAnimating()
    }
    
}
