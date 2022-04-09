//
//  ViewController.swift
//  WebNavigation
//
//  Created by Idwall Go Dev 008 on 28/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    lazy var webview: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webview = WKWebView(frame: .zero, configuration: webConfiguration)
        webview.navigationDelegate = self
        webview.translatesAutoresizingMaskIntoConstraints = false
        return webview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Navigation"
        configureUI()
        setupWebView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavBar()
        
    }
    
    private func setupWebView() {
        let url = URL(string: "https://www.apple.com")
        let request = URLRequest(url: url!)
        webview.load(request)
    }
    
    private func configureUI() {
        view.addSubview(webview)
        
        NSLayoutConstraint.activate([
            webview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupNavBar() {
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        appearence.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let forwardBarItem = UIBarButtonItem(image: UIImage(systemName: "arrow.right"), style: .plain, target: self, action: #selector(forwardAction))
        let backBarItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backAction))
        let reloadBarItem = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise"), style: .plain, target: self, action: #selector(reloadAction))
        
        navigationItem.leftBarButtonItem = reloadBarItem
        navigationItem.rightBarButtonItems = [forwardBarItem, backBarItem]
        
    }
}

extension ViewController {
    @objc func forwardAction() {
        if webview.canGoForward {
            webview.goForward()
        }
    }
    
    @objc func backAction() {
        if webview.canGoBack {
            webview.goBack()
        }
    }
    
    @objc func reloadAction() {
        webview.reload()
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("iniciando")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Terminou")
    }
}

