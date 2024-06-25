//
//  MockData.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

struct MockData {
    
    static let sampleDessertItem = Dessert(
        id: "52893",
        name: "Apple & Blackberry Crumble",
        thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"
    )
    
    static let sampleDessertItem2 = Dessert(
        id: "52855",
        name: "Banana Pancakes",
        thumbnailURL: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg"
    )
    
    static let sampleDessertItem3 = Dessert(
        id: "52862",
        name: "Peach & Blueberry Grunt",
        thumbnailURL: "https://www.themealdb.com/images/media/meals/ssxvup1511387476.jpg"
    )
    
    static let dessertItems = [sampleDessertItem, sampleDessertItem3, sampleDessertItem2]
        
    static var fullDessert = DessertDetails(
        id: "52859",
        name: "Key Lime Pie",
        thumbnailURL: "https://www.themealdb.com/images/media/meals/qpqtuu1511386216.jpg",
        category: "Dessert",
        area: "American",
        instructions: "Heat the oven to 160C/fan 140C/gas 3. Whizz the biscuits to crumbs in a food processor (or put in a strong plastic bag and bash with a rolling pin). Mix with the melted butter and press into the base and up the sides of a 22cm loose-based tart tin. Bake in the oven for 10 minutes. Remove and cool.\r\nPut the egg yolks in a large bowl and whisk for a minute with electric beaters. Add the condensed milk and whisk for 3 minutes then add the zest and juice and whisk again for 3 minutes. Pour the filling into the cooled base then put back in the oven for 15 minutes. Cool then chill for at least 3 hours or overnight if you like.\r\nWhen you are ready to serve, carefully remove the pie from the tin and put on a serving plate. To decorate, softly whip together the cream and icing sugar. Dollop or pipe the cream onto the top of the pie and finish with extra lime zest.",
        strTags: "Cake,Pie,Desert,Fruity,Sour",
        ingredientsList: ["Digestive Biscuits", "Butter", "Condensed Milk", "Egg Yolks", "Lime", "Double Cream", "Icing Sugar", "Lime"],
        measurementsList: ["300g", "150g", "400g", "3", "4", "300ml", "1 tbls", "to serve"]
    )
}
