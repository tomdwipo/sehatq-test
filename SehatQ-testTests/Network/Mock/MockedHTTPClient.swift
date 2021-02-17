//
//  MockedHTTPClient.swift
//  SehatQ-testTests
//
//  Created by user on 12/02/21.
//

import Foundation
@testable import SehatQ_test


class MockedHTTPClient: HTTPClientProtocol {
    func getHomeData(completion: @escaping (Home?) -> Void) {
        guard let url = Bundle(for: type(of: self)).url(forResource: "home-response-success", withExtension: "json"),let responseData = try? Data(contentsOf: url) else { return }
        completion(HTTPClient.shared.converDataToModel(responseData: responseData))
    }
}
