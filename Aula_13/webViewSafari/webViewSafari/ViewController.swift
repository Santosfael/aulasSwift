//
//  ViewController.swift
//  webViewSafari
//
//  Created by Idwall Go Dev 008 on 28/03/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    lazy private var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Call safari", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(callSafari), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        configureButton()
    }

    private func configureButton() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc private func callSafari() {
        if let url = URL(string: "http://www.apple.com") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let viewController = SFSafariViewController(url: url, configuration: config)
            viewController.delegate = self
            viewController.preferredControlTintColor = .black
            viewController.dismissButtonStyle = .close
            viewController.preferredBarTintColor = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
            present(viewController, animated: true)
        }
    }
}

extension ViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true) {
            print("Completou")
        }
    }
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("didLoadSuccessfully \(didLoadSuccessfully)")
    }
}

