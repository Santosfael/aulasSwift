//
//  GodevView.swift
//  GoDev
//
//  Created by Idwall Go Dev 008 on 29/03/22.
//

import UIKit

public class GodevView: UIView {
    
    lazy var textInfo: UILabel = {
        let label = UILabel()
        label.text = "estou centralizado"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public init(bg: UIColor, borderColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = bg
        self.layer.cornerRadius = 9
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
        configTextInfo()
    }
    
    private func configTextInfo() {
        addSubview(textInfo)
        
        NSLayoutConstraint.activate([
            textInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            textInfo.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
