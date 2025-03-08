//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Szczepan Abramczyk on 3/7/25.
//

import SwiftUI


struct CurrencyIcon: View {
    
    @Environment(\.dismiss) var dismiss
    
    let currencyImage: ImageResource
    let currencyName: String
    var body: some View {
        ZStack(alignment: .bottom) {
            //Currency img
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            //currency name
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
        
    }
}
    

#Preview {
    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
    }

