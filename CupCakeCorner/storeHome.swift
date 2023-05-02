//
//  storeHome.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 01/05/2023.
//

import SwiftUI

struct storeHome: View {
    @State var cartItems: [storeItems] = []
    @State var isPresentingCart = false
    
    var columns = [GridItem(.flexible()), GridItem(.flexible())]
    var items = [
        storeItems(imageName: "VanillaCupcake", title: "Vanilla Cupcake", price:
                    2.00, color: .white, selfIndex: 0),
        storeItems(imageName: "ChocolateeCupcake", title: "Chocolate Cupcake", price: 2.00, color: .white, selfIndex: 1),
        storeItems(imageName: "strawberrycupcakey", title: "Strawberry Cupcake", price: 2.00, color: .white, selfIndex: 2),
        storeItems(imageName: "Rainbowcupcake", title: "Rainbow Cupcake", price:
                    2.00, color: .white, selfIndex: 3)
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                VStack {
                    HStack {
                        Text("Cupcake Corner \t Fresh Cupcakes")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .frame(width: 320, alignment: .leading)
                        Spacer().frame(height: 20)
                        
                        Image(systemName: "face.smiling")
                            .resizable()
                            .frame(width: 40, height: 50, alignment: .leading)
                        
                    }
                }
                .padding()
                ScrollView() {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(items, id: \.selfIndex) { item in
                            storeItems(imageName: item.imageName, title: item.title, price: item.price, color: item.color, selfIndex: item.selfIndex)
                                .onTapGesture {
                                    addItemToCart(item)
                                }
                        }
                    }
                }.padding(20)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentingCart = true
                    }, label: {
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                    })
                }
            }
            .sheet(isPresented: $isPresentingCart) {
                Cart(cartItems: $cartItems)
            }
        }
    }
    
    private func addItemToCart(_ item: storeItems) {
        cartItems.append(item)
    }
}

struct storeHome_Previews: PreviewProvider {
    static var previews: some View {
        storeHome()
    }
}
