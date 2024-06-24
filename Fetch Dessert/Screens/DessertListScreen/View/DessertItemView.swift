//
//  MenuItemView.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import SwiftUI

struct DessertItemView: View {
    let item: Dessert
    
    var body: some View {
        HStack {
//            AsyncImage(url: URL(string: item.thumbnailURL)) { image in
//                image
//                    .resizable()
//                    .frame(width: 120, height: 90)
//                    .clipShape(RoundedRectangle(cornerRadius: 8))
//            } placeholder: {
//                ProgressView()
//                    .frame(width: 120, height: 90)
//            }
            DessertImageView(urlString: item.thumbnailURL)
                .frame(width: 120, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(item.name)
                .font(.headline)
                .padding(.leading)
        }
    }
}

#Preview {
    DessertItemView(item: MockData.sampleDessertItem)
}
