//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 30/04/2023.
//

import SwiftUI

struct AddressView: View {
    // Declare an observed object property with the `Order` class
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                // Add a text field for the name property of the `Order` class
                TextField("Name", text: $order.name)
                // Add a text field for the streetAddress property of the `Order` class
                TextField("Street address", text: $order.streetAddress)
                // Add a text field for the city property of the `Order` class
                TextField("City", text: $order.city)
                // Add a text field for the zip property of the `Order` class
                TextField("Zip", text: $order.zip)
            }
            Section {
                // Create a navigation link to the `CheckoutViews` view and pass the `order` object as a parameter
                NavigationLink(destination: CheckoutViews(order: order)) {
                    Text("Check out")
                }
            }
            // Disable the checkout button if the address is invalid
            .disabled(order.hasValidAddress == false)
        }
        // Set the navigation title of the view
        .navigationTitle("Delivery details")
        // Set the display mode for the navigation title
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            // Create an instance of the `AddressView` and pass a new `Order` object as a parameter
            AddressView(order: Order())
        }
    }
}
