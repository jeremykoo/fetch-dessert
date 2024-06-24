//
//  ContentView.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import SwiftUI

struct DessertListView: View {
    @State private var searchText = ""
    private let service: DessertService
    @StateObject var viewModel: DessertViewModel
    
    init(service: DessertService) {
        self.service = service
        self._viewModel = StateObject(wrappedValue: DessertViewModel(service: service))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { dessert in
                    NavigationLink(value: dessert) {
                        DessertItemView(item: dessert)
                    }
                }
            }
            .navigationDestination(for: Dessert.self) { dessert in
                DessertDetailsView(service: service, dessert: dessert)
            }
            .navigationTitle("Desserts")
            .searchable(text: $searchText, prompt: "Search for a dessert")
        }
    }
    
    var searchResults: [Dessert] {
        if searchText.isEmpty {
            return viewModel.dessertList
        } else {
            return viewModel.dessertList.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    DessertListView(service: DessertService())
}
