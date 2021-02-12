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









// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let data: DataClass
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.dataClassTask(with: url) { dataClass, response, error in
//     if let dataClass = dataClass {
//       ...
//     }
//   }
//   task.resume()

// MARK: - DataClass
struct DataClass: Codable {
    let category: [Category]
    let productPromo: [ProductPromo]
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.categoryTask(with: url) { category, response, error in
//     if let category = category {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Category
struct Category: Codable {
    let imageURL: String
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case imageURL
        case id, name
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.productPromoTask(with: url) { productPromo, response, error in
//     if let productPromo = productPromo {
//       ...
//     }
//   }
//   task.resume()



typealias Welcome = [WelcomeElement]
