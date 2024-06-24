//
//  DessertList.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

struct Response: Decodable {
    let meals: [Dessert]
}

struct Dessert: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let thumbnailURL: String

    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
    }
}
