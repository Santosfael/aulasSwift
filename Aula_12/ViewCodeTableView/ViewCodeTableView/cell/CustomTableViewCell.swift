//
//  CustomTableViewCell.swift
//  ViewCodeTableView
//
//  Created by Idwall Go Dev 008 on 24/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let indentifier = "CustomTableViewCell"
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "house")
        image.contentMode = .scaleAspectFit
        image.tintColor = .purple
        return image
    }()
    
    lazy var contentStackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.contentMode = .top
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let title = CustomLabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .systemGray
        title.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        title.text = "Rafael Rocha dos Santos"
        return title
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = CustomLabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "É um texto modelo da indústria tipográfica e de impressão. O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500, quando uma misturou os caracteres de um texto para criar um espécime de livro."
        
        return description
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
