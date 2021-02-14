//
//  Home.swift
//  SehatQ-test
//
//  Created by user on 12/02/21.
//


import Foundation

// MARK: - WelcomeElement

struct Home: Codable {
    var category: [Categorys]
    var productPromo: [ProductPromo]
    enum CodingKeys: String, CodingKey {
        case category
        case productPromo
    }
}

struct Categorys: Codable {
    let imageURL: String
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case imageURL
        case id, name
    }
}

struct ProductPromo: Codable {
    let id: String
    let imageURL: String
    let title, productPromoDescription, price: String
    let loved: Int

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL
        case title
        case productPromoDescription
        case price, loved
    }
}
