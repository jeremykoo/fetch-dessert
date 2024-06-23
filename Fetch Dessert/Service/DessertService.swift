//
//  DessertService.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

class DessertService {
    static let shared = DessertService()
    
    private let dessertListURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    private let dessertDetailBaseURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    func fetchDessertList() async throws -> [DessertItem] {
        guard let url = URL(string: dessertListURL) else {
            throw DessertError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw DessertError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw DessertError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([DessertItem].self, from: data)
        } catch {
            throw DessertError.invalidData
        }
    }
}
