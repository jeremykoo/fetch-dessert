//
//  DessertDetailView.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import SwiftUI

struct DessertDetailsView: View {
    
    private let dessert: Dessert
    private let service: DessertServiceProtocol
    @ObservedObject var viewModel: DessertDetailsViewModel
    
    init(service: DessertServiceProtocol, dessert: Dessert) {
        self.dessert = dessert
        self.service = service
        self.viewModel = DessertDetailsViewModel(service: service, dessertID: dessert.id)
    }
    
    var body: some View {
        ScrollView {
            if let details = viewModel.dessertDetails {
                Text(details.area ?? "")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                DessertImageView(urlString: details.thumbnailURL)
                    .frame(width: 240, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                categoriesView(for: details)
                
                ingredientsView(for: details)
                
                instructionsView(for: details)
            }
        }
        .task {
            await viewModel.fetchDessertDetails()
        }
        .navigationTitle(dessert.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func categoriesView(for details: DessertDetails) -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(details.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.footnote)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 2)
                        )
                        .padding(.vertical, 10)
                        .foregroundStyle(.yellow)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func ingredientsView(for details: DessertDetails) -> some View {
        VStack {
            Text("Ingredients")
                .font(.headline)
            
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(0..<(details.measurementsList?.count ?? 0), id: \.self) { index in
                    VStack {
                        (
                            Text(details.ingredientsList?[index] ?? "")
                            +
                            Text(" - ")
                            +
                            Text(details.measurementsList?[index] ?? "")
                        )
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        
                        DessertImageView(urlString: viewModel.ingredientImageBaseURL + (details.ingredientsList?[index] ?? "") + ".png")
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .padding(.bottom)
                        
                        Spacer()
                    }
                }
            }
        }
        .padding([.horizontal, .top])
        .background(.brown.opacity(0.3))
    }
    
    private func instructionsView(for details: DessertDetails) -> some View {
        VStack(spacing: 12) {
            Text("Instructions")
                .font(.headline)
            
            Text(details.instructions ?? "")
                .font(.callout)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        DessertDetailsView(service: MockService(), dessert: MockData.sampleDessertItem)
    }
}
