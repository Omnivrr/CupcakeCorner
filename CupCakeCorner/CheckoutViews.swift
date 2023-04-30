//
//  CheckoutViews.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 30/04/2023.
//

import SwiftUI

struct CheckoutViews: View {
    @ObservedObject var order: Order
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CheckoutViews_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutViews(order: Order())
    }
}
