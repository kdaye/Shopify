//
//  ProductVariant+Price.swift
//  Shopify
//  Documentation https://dskit.app/components
//
//  Created by Borinschi Ivan on 29.04.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import Buy
import DSKit

extension Storefront.ProductVariant {
    
    func price() -> DSPrice? {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        if let amount = formatter.string(from: price.amount as NSNumber),
           let compareAtAmount = compareAtPrice?.amount,
           let regularAmount = formatter.string(from: compareAtAmount as NSNumber) {
            return DSPrice(amount: amount, regularAmount: regularAmount, currency: price.currencyCode.rawValue)
        } else if let amount = formatter.string(from: price.amount as NSNumber) {
            return DSPrice(amount: amount, currency: price.currencyCode.rawValue)
        }
        
        return nil
    }
}
