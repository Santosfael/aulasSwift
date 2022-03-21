//
//  User.swift
//  AppNetworking
//
//  Created by Idwall Go Dev 008 on 18/03/22.
//

import Foundation
//Codable é um elias para um tipo de protocolo o encodable e decodable
//Encodable - para ser serializado e enviado para o servidor
//decodable - para deserializar um objeto para estutura
struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address?
    let phone: String
    let company: Company
}

struct Address: Codable {
    let street, city, zipcode: String?
}

struct Company: Codable {
    let name: String
}
