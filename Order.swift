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
    
    
}
