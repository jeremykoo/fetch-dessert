//
//  DessertDetailViewModel.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/23/24.
//

import Foundation

@MainActor
class DessertDetailsViewModel: ObservableObject {
    
    let ingredientImageBaseURL = "https://themealdb.com/images/ingredients/"
    private let service: DessertService
    private let dessertID: String
    @Published var dessertDetails: DessertDetails?
    
    init(service: DessertService, dessertID: String) {
        self.service = service
        self.dessertID = dessertID
    }
    
    func fetchDessertDetails() async {
        do {
            dessertDetails = try await service.fetchDessertDetails(for: dessertID).first
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
