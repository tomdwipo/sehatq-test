//
//  HTTPClientProtocol.swift
//  SehatQ-test
//
//  Created by user on 12/02/21.
//

import Foundation

protocol HTTPClientProtocol {
    func getHomeData(completion: @escaping (Home?) -> Void )
}
