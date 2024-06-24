//
//  ImageLoader.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/23/24.
//

import Foundation
import SwiftUI

@MainActor
class ImageLoader: ObservableObject {
    @Published var isLoading = false
    @Published var image: Image?
    
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        Task {
            isLoading = true
            await loadImage()
            isLoading = false
        }
    }
    
    private func loadImage() async {
        if let cached = ImageCache.shared.get(forKey: urlString) {
//            print("DEBUG: Did fetch image from cache")
            self.image = Image(uiImage: cached)
            return
        }
            
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
//            print("DEBUG: Did receive data from endpoint..")
            
            guard let uiImage = UIImage(data: data) else { return }
            ImageCache.shared.set(uiImage, forKey: urlString)
            self.image = Image(uiImage: uiImage)
        } catch {
            print("DEBUG: Failed to fetch image with error \(error)")
        }
    }
}

