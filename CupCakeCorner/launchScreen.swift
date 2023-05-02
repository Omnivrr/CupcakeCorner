//
//  launchScreen.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 01/05/2023.
//

import SwiftUI

struct launchScreen: View {
    // Declare two state variables to control the animation
    // `isAnimating` is used to toggle the opacity of the text
    // `Offset` is used to control the vertical position of the text
    @State private var isAnimating = false
    @State private var shakeCake: CGFloat = 0
    
    var body: some View {
    
        ZStack {
            Color.white
                .ignoresSafeArea()
        
            Image("NiceCupcake")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(shakeCake))
                .animation(.interpolatingSpring(stiffness: 60, damping: 5))
            Spacer()
            Spacer()
 
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 3.0).repeatForever()) {
                shakeCake = 15
            }
        }
    }
}
struct launchScreen_Previews: PreviewProvider {
    static var previews: some View {
        launchScreen()
    }
}
