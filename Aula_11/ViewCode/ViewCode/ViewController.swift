//
//  ViewController.swift
//  ViewCode
//
//  Created by Idwall Go Dev 008 on 22/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Defaults {
        static let textInfo = "É um texto modelo da indústria tipográfica e de impressão. O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500, quando uma misturou os caracteres de um texto para criar um espécime de livro."
        
        static let titleButton = "Call View"
        static let descriptionInfo = "Label"
    }
    
    //var button : UIButton = UIButton()
    private var safeArea: UILayoutGuide!
    
    //Clojure - Espera uma declaração do mesmo tipo
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "airplane")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = Defaults.textInfo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Defaults.titleButton, for: .normal)
        button.addTarget(self, action: #selector(getView), for: .touchUpInside)
        button.backgroundColor = .orange
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        //Muito parecido com addTarget, mas só funciona em novos
        //button.addAction(UIAction, for: .touchUpOutside)
        return button
    }()
    
    lazy var content: UIView = {
        let view = UIView()
        view.backgroundColor = .systemIndigo
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .grayViewCode
        label.text = Defaults.descriptionInfo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func getView() {
        print("Cliquei aqui")
    }
    
    private func addSubViews() {
        view.addSubViews(iconImageView, callButton, titleLabel, content)
        
        content.addSubview(descriptionLabel)
    }
    
    private func configureIconImageView() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //Button
            
       ])
    }
    
    private func configureTitleLabel() {
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default).isActive = true
        //titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func configureCallButton() {
        NSLayoutConstraint.activate([
            callButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default),
            callButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default),
            callButton.heightAnchor.constraint(equalToConstant: Metrics.Margin.input)
        ])
    }
    
    private func configureContentView() {
        //Content
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 20),
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            content.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    private func configureDescriptionLabel() {
        //description label
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: content.centerYAnchor)
        ])
    }
    
    private func configureView() {
        title = "View Controller"
        view.backgroundColor = .lightGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        addSubViews()
        
        configureView()
        configureIconImageView()
        configureTitleLabel()
        configureCallButton()
        configureContentView()
        configureDescriptionLabel()
        
        

//        button.setTitle("Button View", for: .normal)
//        button.frame = CGRect(x: 100, y: 100, width: 130, height: 45)
//        button.backgroundColor = .red
//        button.tintColor = .white
        
        
        
    }
    
    /*
     Hide header
     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }*/


}

