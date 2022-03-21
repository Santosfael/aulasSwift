//
//  CeoCompany.swift
//  desafioList
//
//  Created by Idwall Go Dev 008 on 21/03/22.
//

import Foundation

// MARK: - CeoCompany
struct CeoCompany: Codable {
    let id: Int
    let name: String
    let photo: String
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
}
