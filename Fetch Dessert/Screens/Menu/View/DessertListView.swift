//
//  ContentView.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import SwiftUI

struct DessertListView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(MockData.dessertItems) { dessertItem in
                    DessertItemView(item: dessertItem)
                }
            }
            .navigationTitle("Desserts")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    DessertListView()
}
