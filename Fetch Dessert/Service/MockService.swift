//
//  MockService.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/24/24.
//

import Foundation

class MockService: DessertServiceProtocol {
    func fetchDessertList() async throws -> [Dessert] {
        return MockData.dessertItems
    }
    
    func fetchDessertDetails(for id: String) async throws -> [DessertDetails] {
        return [MockData.fullDessert]
    }
}
