//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Bukhari Sani on 28/04/2023.
//

import SwiftUI

struct Response: Codable {
    var results: [Result] // an array of Result structs
}

struct Result: Codable {
    var trackId: Int // unique identifier for a song
    var trackName: String // name of the song
    var collectionName: String // name of the collection/album that the song belongs to
}

struct ContentView: View {
    @State private var results = [Result]() // an empty array of Result structs
    
    var body: some View {
        List(results, id: \.trackId) { item in // a list that displays the song results
            VStack(alignment: .leading) { // a vertical stack that displays the song's name and collection name
                Text(item.trackName) // the name of the song
                    .font(.headline)
                Text(item.collectionName) // the name of the collection/album that the song belongs to
            }
        }
        .task { // asynchronously load data from the iTunes API when the view is first displayed
           await loadData()
        }
    }
    
    func loadData() async { // a function to fetch data from the iTunes API
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else
        {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url) // fetch data from the iTunes API
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) { // decode the response into a Response struct
                results = decodedResponse.results // update the results array with the decoded response
            }
        } catch {
            print("Invalid data")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
