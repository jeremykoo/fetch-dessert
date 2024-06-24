//
//  MockData.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import Foundation

struct MockData {
    
    static var sampleDessertItem = Dessert(
        id: "52893",
        name: "Apple & Blackberry Crumble",
        thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"
    )
    
    static var sampleDessertItem2 = Dessert(
        id: "52894",
        name: "Apple & Blackberry Crumble 2",
        thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"
    )
    
    static var sampleDessertItem3 = Dessert(
        id: "52895",
        name: "Apple & Blackberry Crumble 3",
        thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"
    )
    
    static var dessertItems = [sampleDessertItem, sampleDessertItem2, sampleDessertItem3]
    
//    static var fullDessert = DessertDetails(
//        id: "52859",
//        name: "Key Lime Pie",
//        thumbnailURL: "https://www.themealdb.com/images/media/meals/qpqtuu1511386216.jpg",
//        category: "Dessert",
//        area: "American",
//        instructions: "Heat the oven to 160C/fan 140C/gas 3. Whizz the biscuits to crumbs in a food processor (or put in a strong plastic bag and bash with a rolling pin). Mix with the melted butter and press into the base and up the sides of a 22cm loose-based tart tin. Bake in the oven for 10 minutes. Remove and cool.\r\nPut the egg yolks in a large bowl and whisk for a minute with electric beaters. Add the condensed milk and whisk for 3 minutes then add the zest and juice and whisk again for 3 minutes. Pour the filling into the cooled base then put back in the oven for 15 minutes. Cool then chill for at least 3 hours or overnight if you like.\r\nWhen you are ready to serve, carefully remove the pie from the tin and put on a serving plate. To decorate, softly whip together the cream and icing sugar. Dollop or pipe the cream onto the top of the pie and finish with extra lime zest.",
//        strTags: "Cake,Pie,Desert,Fruity,Sour",
//        strIngredient1: "Digestive Biscuits",
//        strIngredient2: "Butter",
//        strIngredient3: "Condensed Milk",
//        strIngredient4: "Egg Yolks",
//        strIngredient5: "Lime",
//        strIngredient6: "Double Cream",
//        strIngredient7: "Icing Sugar",
//        strIngredient8: "Lime",
//        strMeasure1: "300g",
//        strMeasure2: "150g",
//        strMeasure3: "400g",
//        strMeasure4: "3",
//        strMeasure5: "4",
//        strMeasure6: "300ml ",
//        strMeasure7: "1 tbls",
//        strMeasure8: "to serve"
//    )
}
