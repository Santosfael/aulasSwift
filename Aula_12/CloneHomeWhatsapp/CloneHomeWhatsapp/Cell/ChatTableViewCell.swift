//
//  ChatTableViewCell.swift
//  CloneHomeWhatsapp
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"
    
    lazy var personImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.layer.cornerRadius = 26
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var containerVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 11
        stack.contentMode = .top
        return stack
    }()
    
    lazy var contentNameAndDateHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.contentMode = .center
        return stack
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rafael"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        label.text = "11/01/2022"
        return label
    }()
    
    lazy var talkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        label.numberOfLines = 2
        label.text = "Actually I wanted to check with you about your online business plan on our textexte raafaf taasad"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDataTalk(talks: Talk) {
        personImage.loadImage(from: talks.picture)
        nameLabel.text = talks.name
        dateLabel.text = talks.latest_timestamp
        talkLabel.text = talks.lastChat
    }
}

extension ChatTableViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(personImage)
        contentNameAndDateHorizontalStack.addArrangedSubview(nameLabel)
        contentNameAndDateHorizontalStack.addArrangedSubview(dateLabel)
        containerVerticalStack.addArrangedSubview(contentNameAndDateHorizontalStack)
        containerVerticalStack.addArrangedSubview(talkLabel)
        addSubview(containerVerticalStack)
    }
    
    func setupConstraints() {
        //Imagem
        NSLayoutConstraint.activate([
            personImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            personImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            personImage.widthAnchor.constraint(equalToConstant: 52),
            personImage.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        //vertical stack
        NSLayoutConstraint.activate([
            containerVerticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerVerticalStack.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 12),
            containerVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            containerVerticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    func applyAdditionalChanges() {
        
    }
    
    
}
