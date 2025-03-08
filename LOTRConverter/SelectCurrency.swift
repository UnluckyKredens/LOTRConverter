//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Szczepan Abramczyk on 3/7/25.
//

import SwiftUI


struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency;
    @Binding var rightCurrency: Currency;
    
    var body: some View {
        ZStack {
            //bgImg
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                //Currency Icons
                IconGrid(currency: $leftCurrency)
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                //Currency icons
                IconGrid(currency: $rightCurrency)
                //Done btn
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
        }.foregroundStyle(.black)
    }
}
    

#Preview {
    @Previewable @State var leftCurrency: Currency = .silverPenny
    @Previewable @State var rightCurrency: Currency = .silverPenny
    SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
    }

