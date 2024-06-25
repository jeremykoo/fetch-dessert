//
//  Fetch_DessertApp.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import SwiftUI

@main
struct Fetch_DessertApp: App {
    private let service = DessertService()
    
    var body: some Scene {
        WindowGroup {
            DessertListView(service: service)
        }
    }
}
