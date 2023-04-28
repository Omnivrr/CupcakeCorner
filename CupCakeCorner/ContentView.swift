//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 28/04/2023.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum Codingkeys: CodingKey {
        case name
    }
    
    @Published var name = "abdulQadeer"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
