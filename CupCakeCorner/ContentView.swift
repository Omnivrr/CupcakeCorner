// ContentView.swift
// This is the main view for the Cupcake Corner app.

import SwiftUI

struct ContentView: View {
    // Create a new order object to track the user's selections.
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            // Display a form with sections for selecting cake type and quantity,
            // special requests, and delivery details.
            Form {
                Section {
                    // Display a picker for selecting the cake type.
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    // Display a stepper for selecting the quantity of cakes.
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    // Display a toggle for enabling special requests.
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    // If special requests are enabled, display toggles for adding extra frosting and sprinkles.
                    if  order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    // Display a navigation link to the AddressView for entering delivery details.
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
