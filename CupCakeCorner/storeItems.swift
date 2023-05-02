import SwiftUI

struct storeItems: View, Equatable, Hashable {
    var id = UUID()
    var imageName: String
    var title: String
    var price: Double
    var color: Color
    var selfIndex: Int
    
    static func == (lhs: storeItems, rhs: storeItems) -> Bool {
        return lhs.id == rhs.id
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(color)
                .opacity(0.25)
                .shadow(radius: 15)
                .frame(width: 170, height: 230)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width:170, height: 160)
                    .cornerRadius(15)
                
                Text(title)
                
                Button(action: {
                    // Replace cartItems with the appropriate @Binding variable
                }) {
                    Text("$\(String(format: "%.2f", price))")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 28)
                        .background(Color.gray)
                }
            }
        }
    }
}

struct storeItems_Previews: PreviewProvider {
    static var previews: some View {
        storeItems(imageName: "strawberrycupcakey", title: "Strawberry Cupcake", price: 2.00, color: Color.white, selfIndex: 0)
    }
}
