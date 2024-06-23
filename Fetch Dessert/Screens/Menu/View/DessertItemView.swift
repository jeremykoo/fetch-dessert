//
//  MenuItemView.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import SwiftUI

struct DessertItemView: View {
    let item: DessertItem
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.strMealThumb)) { image in
                image
                    .resizable()
                    .frame(width: 120, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                ProgressView()
//                Rectangle()
                    .frame(width: 120, height: 90)
//                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Text(item.strMeal)
                .font(.headline)
                .padding(.leading)
        }
    }
}

#Preview {
    DessertItemView(item: MockData.sampleDessertItem)
}
