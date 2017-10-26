//
//  Model.swift
//  TipCalculator
//
//  Created by Rimil Dey on 23/10/17.
//  Copyright © 2017 Rimil Dey. All rights reserved.
//

import Foundation

class Model {
    
    var subtotalFromTextField = "0.00"
    var tipPercentFromSlider = 15
    
    var subtotalAsDecimal : NSDecimalNumber {
        return NSDecimalNumber(string: subtotalFromTextField)
    }
    
    var tipPercent : NSDecimalNumber{
        return NSDecimalNumber(value:
            Double(tipPercentFromSlider)/100
        )
    }
    
    var tipAmount: NSDecimalNumber {
        return subtotalAsDecimal.multiplying(by: tipPercent)
    }
    
    var totalAmount: NSDecimalNumber {
        return subtotalAsDecimal.adding(tipAmount)
    }
    
    // MARK: - Convert to currency
    
    let formatter = NumberFormatter()
    
    var subtotalAsCurrency : String {
        formatter.numberStyle = .currency
        return formatter.string (from: subtotalAsDecimal as NSNumber)!
    }
    
    var tipAmountAsCurrency : String {
        formatter.numberStyle = .currency
        return formatter.string (from: tipAmount as NSNumber)!

    }
    
    var totalAmountAsCurrency : String {
        formatter.numberStyle = .currency
        return formatter.string (from: totalAmount as NSNumber)!
        
    }
}
