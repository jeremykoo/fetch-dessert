//
//  DessertDetailView.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import SwiftUI

struct DessertDetailsView: View {
    
    private let dessert: Dessert
    private let service: DessertService
    @ObservedObject var viewModel: DessertDetailsViewModel
    
    init(service: DessertService, dessert: Dessert) {
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
                                
                                DessertImageView(urlString: viewModel.ingredientImageBaseURL + (details.ingredientsList?[index] ?? "") + ".png")
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .padding(.bottom)
                            }
                        }
                    }
                }
                .padding([.horizontal, .top])
                .background(.brown.opacity(0.3))
                
                VStack(spacing: 12) {
                    Text("Instructions")
                        .font(.headline)
                    
                    Text(details.instructions ?? "")
                        .font(.callout)
                }
                .padding()
            }
        }
        .task {
            await viewModel.fetchDessertDetails()
        }
        .navigationTitle(dessert.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DessertDetailsView(service: DessertService(), dessert: MockData.sampleDessertItem)
    }
}
