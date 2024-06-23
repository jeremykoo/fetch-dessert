//
//  DessertDetailView.swift
//  Fetch Dessert
//
//  Created by Jeremy Koo on 6/22/24.
//

import SwiftUI

struct DessertDetailView: View {
    var body: some View {
        ScrollView {
            Text("Key Lime Pie")
                .font(.title2.bold())
            Text("American")
                .font(.callout)
            
            Rectangle()
                .frame(width: 240, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(0..<4) { _ in
                        Text("Cake")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 2)
                            )
                            .padding(.vertical)
                            .foregroundStyle(.yellow)
                    }
                }
                .padding(.horizontal)
            }
            
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(0..<7) { num in
                    VStack {
                        Text("Ingredient \(num)")
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            
            Text("Heat the oven to 160C/fan 140C/gas 3. Whizz the biscuits to crumbs in a food processor (or put in a strong plastic bag and bash with a rolling pin). Mix with the melted butter and press into the base and up the sides of a 22cm loose-based tart tin. Bake in the oven for 10 minutes. Remove and cool.\r\nPut the egg yolks in a large bowl and whisk for a minute with electric beaters. Add the condensed milk and whisk for 3 minutes then add the zest and juice and whisk again for 3 minutes. Pour the filling into the cooled base then put back in the oven for 15 minutes. Cool then chill for at least 3 hours or overnight if you like.\r\nWhen you are ready to serve, carefully remove the pie from the tin and put on a serving plate. To decorate, softly whip together the cream and icing sugar. Dollop or pipe the cream onto the top of the pie and finish with extra lime zest.")
        }
    }
}

#Preview {
    DessertDetailView()
}
