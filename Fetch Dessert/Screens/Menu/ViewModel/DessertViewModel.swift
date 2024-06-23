//
//  DessertViewModel.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

class DessertViewModel: ObservableObject {
    
    @Published var dessertList: [DessertItem] = []
    
    func fetchDessertList() async {
        do {
            dessertList = try await DessertService.shared.fetchDessertList()
        } catch {
            guard let error = error as? DessertError else { return }
            print("Error: \(error.errorDescription)")
        }
    }
    
}
