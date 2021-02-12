//
//  HTTPClientTests.swift
//  SehatQ-testTests
//
//  Created by user on 12/02/21.
//

import XCTest
@testable import SehatQ_test
import Foundation

class HTTPClientTests: XCTestCase {

    func test_DataToModelConverter(){
        XCTAssertNotNil(HTTPClient.shared)
        var home: Home?
       
        XCTAssertNil(HTTPClient.shared.converDataToModel(responseData: nil))

        
        guard let url = Bundle(for: MockedHTTPClient.self).url(forResource: "home-response-success", withExtension: "json"),let responseData = try? Data(contentsOf: url) else { return }
       
        home = HTTPClient.shared.converDataToModel(responseData: responseData)
        
        XCTAssertNotNil(home)
        XCTAssertTrue(home!.category.count != 0)
        XCTAssertTrue(home!.productPromo.count != 0)

    }
    
    
    func test_getHomeData(){
        let exp = expectation(description: "test")
        let exp2 = expectation(description: "test")

        let service: HTTPClientProtocol = HTTPClient()
        var data: Home?

        let serviceMock: HTTPClientProtocol = MockedHTTPClient()
        var dataMock: Home?
        
        service.getHomeData { (result) in
            data = result
            exp.fulfill()
        }
        
        serviceMock.getHomeData { (result) in
            dataMock = result
            exp2.fulfill()
        }
        wait(for: [exp, exp2], timeout: 5.0)
        XCTAssertNotNil(data)
        XCTAssertNotNil(dataMock)
        XCTAssertEqual(data!.category[0].id, dataMock!.category[0].id)

    }
    
}
