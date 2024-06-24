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

    private let dessertID: String
    @Published var dessertDetails: DessertDetails?
    
    init(dessertID: String) {
        self.dessertID = dessertID
    }
    
    func fetchDessertDetails() async {
        do {
            dessertDetails = try await DessertService.shared.fetchDessertDetails(for: dessertID).first
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
