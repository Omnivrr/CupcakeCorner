//
//  CupCakeCornerApp.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 28/04/2023.
//

import SwiftUI

@main
struct CupCakeCornerApp: App {
    @State private var showMainView = false
    
    var body: some Scene {
        WindowGroup {
            if showMainView {
                ContentView()
            } else {
                launchScreen()
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showMainView = true
                            
                    }
                }
            }
        }
    }
}
