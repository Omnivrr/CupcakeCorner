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
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3)
                { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place order", action: {})
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct CheckoutViews_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutViews(order: Order())
    }
}
