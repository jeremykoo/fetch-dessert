//
//  DessertService.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

protocol DessertServiceProtocol {
    func fetchDessertList() async throws -> [Dessert]
    func fetchDessertDetails(for id: String) async throws -> [DessertDetails]
}

class DessertService: DessertServiceProtocol {
    
    private let dessertListURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    private let dessertDetailBaseURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    func fetchDessertList() async throws -> [Dessert] {
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
            let values = try JSONDecoder().decode(Response.self, from: data)
            return values.meals
        } catch {
            throw DessertError.invalidData
        }
    }
    
    func fetchDessertDetails(for id: String) async throws -> [DessertDetails] {
        let dessertURL = dessertDetailBaseURL + id
        guard let url = URL(string: dessertURL) else {
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
            let values = try decoder.decode(DetailsResponse.self, from: data)
            return values.meals
        } catch {
            throw DessertError.invalidData
        }
    }
}
