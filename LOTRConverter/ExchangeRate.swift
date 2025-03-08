//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Szczepan Abramczyk on 3/7/25.
//

import SwiftUI


struct ExchangeRate: View {
    
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            //Left img
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            //text
            Text(text)
            //right img
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}
    

#Preview {
    ExchangeRate(leftImage: .goldpenny, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpiece)
    }

