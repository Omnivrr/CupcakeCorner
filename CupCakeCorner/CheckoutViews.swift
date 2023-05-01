//
//  CheckoutViews.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 30/04/2023.
//

import SwiftUI

struct CheckoutViews: View {
    @ObservedObject var order: Order // holds the order object that needs to be encoded and sent to the server
    @State private var confirmationMessage = "" // holds the confirmation message to be displayed when the order is successfully placed
    @State private var showingConfirmation = false // determines whether to show the confirmation alert or not
    
    var body: some View {
        ScrollView {
            VStack {
                // displays an image of cupcakes
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                // displays the total cost of the order
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                // button to place the order
                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        
        // confirmation alert to be shown when the order is successfully placed
        .alert("Thank you", isPresented: $showingConfirmation) {
            Button("Ok")  { }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    // function to place the order
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")! // URL of the server to send the order to
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            // decode the response from the server
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x\(Order.types[decodedOrder.type].lowercased()) Cupcakes is on it's way!"
            showingConfirmation = true
            
        } catch {
            // handle the error if the request fails
            print("Checkout failed: \(error.localizedDescription)")
        }
    }
}

struct CheckoutViews_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutViews(order: Order())
    }
}
