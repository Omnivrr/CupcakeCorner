//
//  Order.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 30/04/2023.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Starwaberry", "Chocolate", "Rainbow"]
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled ==  false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
        
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty {
            return false
        }
        
        return true
    }
    var cost: Double {
        //$2 per cake
        var cost = Double(quantity) * 2
        
        // Complicated cake cost more
        cost += (Double(type) / 2)
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
         
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
}
