//
//  ContentView.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import SwiftUI

struct DessertListView: View {
    @State private var searchText = ""
    
    @StateObject var viewModel = DessertViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dessertList) { dessert in
                    NavigationLink(value: dessert) {
                        DessertItemView(item: dessert)
                    }
                }
            }
            .navigationDestination(for: Dessert.self) { dessert in
                DessertDetailsView(dessert: dessert)
            }
            .navigationTitle("Desserts")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    DessertListView()
}
