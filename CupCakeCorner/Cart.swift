import SwiftUI

struct Cart: View {
    @Binding var cartItems: [storeItems]
    
    
    var body: some View {
        VStack {
            Text("My Cart")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
                .frame(width: 320, alignment: .leading)
            
            List {
                ForEach(cartItems, id: \.self) { item in
                    HStack {
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                        VStack(spacing: 5) {
                            Text(item.title)
                            Text("$\(String(format:"%.2f", item.price))")
                                .foregroundColor(.gray)
                            
                        }
                    }
                }.onDelete { indexSet in
                    cartItems.remove(atOffsets: indexSet)
                }
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.pink)
                    .opacity(0.8)
                    .frame(width: 350, height: 100)
                VStack {
                    Text("Total Price")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(width: 350, alignment: .leading)
                    
                        .padding(.leading, 60)
                    Text("$\(String(format: "%.2f", 4.00))")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                }
                Button() {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder()
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                        Text("Place Order")
                            .foregroundColor(.white)
                    }
                }.offset(x: 80)
            }
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart(cartItems: .constant([
            storeItems(imageName: "VanillaCupcake", title: "Vanilla Cupcake", price: 2.00, color: .white, selfIndex: 0),
            storeItems(imageName: "ChocolateeCupcake", title: "Chocolate Cupcake", price: 2.00, color: .white, selfIndex: 1)
        ]))
    }
}

