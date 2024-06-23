//
//  DessertList.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

struct DessertItem: Decodable, Identifiable {
    let id: Int
    let idMeal: Int
    let strMeal: String
    let strMealThumb: String
}
