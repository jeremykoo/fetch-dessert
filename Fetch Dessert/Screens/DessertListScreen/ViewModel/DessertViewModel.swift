//
//  DessertViewModel.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

@MainActor
class DessertViewModel: ObservableObject {
    
    @Published var dessertList: [Dessert] = []
    private let service: DessertService
        
    init(service: DessertService) {
        self.service = service
        Task {
            await fetchDessertList()
        }
    }
    
    func fetchDessertList() async {
        do {
            dessertList = try await service.fetchDessertList()
        } catch {
            guard let error = error as? DessertError else { return }
            print("Error: \(error.errorDescription)")
        }
    }
}
