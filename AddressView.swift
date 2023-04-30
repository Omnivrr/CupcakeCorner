//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 30/04/2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            Section {
                NavigationLink {
                    CheckoutViews(order: order)
                } label: {
                    
                    Text("Check out")
                }
            }
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            AddressView(order: Order())
        }
    }
}
