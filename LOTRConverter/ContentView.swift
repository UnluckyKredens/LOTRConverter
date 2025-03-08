//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Szczepan Abramczyk on 3/7/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmmount = ""
    @State var rightAmmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    let currencyTip = CurrencyTip()
    
    
    var body: some View {
        ZStack {
            //BgImage
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                //Zdjęcie konia
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                //Text zmiany waluty
                Text("Currency Exchange")
                    .font(.title)
                    .foregroundStyle(.white)
                //Sekcja konwersji waluty
                HStack {
                    //Lewa strona konwersji
                    VStack {
                        //Waluta
                        HStack {
                            //Zdjęcie
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Tekst
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.padding(.bottom, -5)
                            .popoverTip(currencyTip, arrowEdge: .bottom)
                        //Textfield
                        TextField("Ammount", text: $leftAmmount).textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)

                    }.onTapGesture {
                        showSelectCurrency.toggle()
                        currencyTip.invalidate(reason: .actionPerformed)
                    }
                    //Znak równości
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    //Prawa strona
                    VStack {
                        //Waluta
                        HStack {
                            //Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            //Zdjęcie
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }.padding(.bottom, -5)
                        //Text field
                        TextField("Ammount", text: $rightAmmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                    }.onTapGesture {
                        showSelectCurrency.toggle()
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                //Info button
                
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }.padding()
                }

            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmmount) {
            if leftTyping {
                rightAmmount = leftCurrency.convert( leftAmmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmmount) {
            if rightTyping {
                leftAmmount = rightCurrency.convert(rightAmmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmmount = rightCurrency.convert(rightAmmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmmount = leftCurrency.convert( leftAmmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }.sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency);
        }
        
    }
}

#Preview {
    ContentView()
}
