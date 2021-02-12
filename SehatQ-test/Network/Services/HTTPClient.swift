//
//  HTTPClient.swift
//  SehatQ-test
//
//  Created by user on 12/02/21.
//

import Foundation

class HTTPClient: HTTPClientProtocol {
    
    static let shared = HTTPClient()
    func getHomeData(completion: @escaping (Home?) -> Void ) {
        
        if let url = URL(string: "https://private-4639ce-ecommerce56.apiary-mock.com/home") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) { data, response, error in
                print(response ?? "")
                completion(self.converDataToModel(responseData: data))
            }.resume()
        }
    }
    
    func converDataToModel(responseData: Data?)-> Home?{
        var home = Home(category: [], productPromo: [])
        var categories: [Categorys] = []
        var productPromoList: [ProductPromo] = []
        
        if let responseData = responseData {
            let json = try? JSONSerialization.jsonObject(with: responseData, options: []) as? [Any]
            if let object = json?[0] as? [String: Any],
               let data = object["data"] as? [String: Any] {
              
                if let category = data["category"] as? [[String: Any]]{
                    for item in category {
                        categories.append(Categorys(imageURL: (item["imageUrl"] as? String) ?? "", id: (item["id"] as? Int) ?? 0, name: (item["name"] as? String) ?? ""))
                    }
                }
                
                if let productPromo = data["productPromo"] as? [[String: Any]]{
                    for item in productPromo {
                        productPromoList.append(ProductPromo(id: (item["id"] as? String) ?? "", imageURL: (item["imageUrl"] as? String) ?? "", title: (item["title"] as? String) ?? "", productPromoDescription: (item["description"] as? String) ?? "", price: (item["price"] as? String) ?? "", loved: (item["loved"] as? Int) ?? 0))
                    }
                }
            }
            print(json ?? "")
            home.category = categories
            home.productPromo = productPromoList
            return home
        }
        return nil
    }
}

