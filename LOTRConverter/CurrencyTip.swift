//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Szczepan Abramczyk on 3/8/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or fight curency to bring up the Select Currency screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
