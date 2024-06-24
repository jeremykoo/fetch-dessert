//
//  DessertDetails.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

struct DetailsResponse: Decodable {
    let meals: [DessertDetails]
}

struct DessertDetails: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let thumbnailURL: String
    let category: String?
    let area: String?
    let instructions: String?
    let strTags: String?
    
    var tags: [String] {
        return strTags?.components(separatedBy: ",") ?? []
    }
    
    var ingredientsList: [String]?
    var measurementsList: [String]?
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnailURL = try container.decode(String.self, forKey: .thumbnailURL)
        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.area = try container.decodeIfPresent(String.self, forKey: .area)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        self.strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
        
        self.ingredientsList = []
        self.measurementsList = []
                
        for index in 1...20 {
            let ingredientKeyIndex = "strIngredient\(index)"
            let measurementKeyIndex = "strMeasure\(index)"
            
            guard let ingredientKey = CodingKeys(rawValue: ingredientKeyIndex) else { print("Coding Key not found"); return }
            guard let measurementKey = CodingKeys(rawValue: measurementKeyIndex) else { print("Coding Key not found"); return }
            
            do {
                let ingredient = try container.decode(String.self, forKey: ingredientKey)
                let measurement = try container.decode(String.self, forKey: measurementKey)
                
                guard !ingredient.isEmpty && !measurement.isEmpty else { return }
                
                self.ingredientsList?.append(ingredient)
                self.measurementsList?.append(measurement)
            } catch {
                // null
                print(error.localizedDescription)
            }
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case strTags
        case strIngredient1,  strIngredient2,
             strIngredient3,  strIngredient4,
             strIngredient5,  strIngredient6,
             strIngredient7,  strIngredient8,
             strIngredient9,  strIngredient10,
             strIngredient11, strIngredient12,
             strIngredient13, strIngredient14,
             strIngredient15, strIngredient16,
             strIngredient17, strIngredient18,
             strIngredient19, strIngredient20
        case strMeasure1,  strMeasure2,
             strMeasure3,  strMeasure4,
             strMeasure5,  strMeasure6,
             strMeasure7,  strMeasure8,
             strMeasure9,  strMeasure10,
             strMeasure11, strMeasure12,
             strMeasure13, strMeasure14,
             strMeasure15, strMeasure16,
             strMeasure17, strMeasure18,
             strMeasure19, strMeasure20
    }
}
