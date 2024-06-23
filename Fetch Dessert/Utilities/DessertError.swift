//
//  DessertError.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

enum DessertError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidStatusCode(statusCode: Int)
    case unableToComplete
    
    var errorDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidResponse: return "Invalid Response"
        case .invalidData: return "Invalid data"
        case let .invalidStatusCode(statusCode): return "Invalid status code: \(statusCode)"
        case .unableToComplete: return "Unable to Complete Operation"
        }
    }
}
