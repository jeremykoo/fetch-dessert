//
//  DessertImageView.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/23/24.
//

import SwiftUI

struct DessertImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(urlString: String) {
        imageLoader = ImageLoader(urlString: urlString)
    }
    
    var body: some View {
        if imageLoader.isLoading {
            ProgressView()
        } else {
            if let image = imageLoader.image {
                image
                    .resizable()
            }
        }
    }
}

#Preview {
    DessertImageView(urlString: "https://www.themealdb.com/images/ingredients/Lime.png")
}
