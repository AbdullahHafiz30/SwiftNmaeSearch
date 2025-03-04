//
//  ContentView.swift
//  namesorter
//
//  Created by Taibah Valley Academy on 04/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var SearchText: String = ""
    @State private var names = ["Abdullah","Naif","Rawan","rayaheen","Tahany","Zohaib","Mohammed"]
    
    @State private var filterLetter: String = ""
    
    @State private var isShuffled: Bool = false
    
    var body: some View {
        VStack {
            TextField("Search...", text: $filterLetter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List(filteredNames, id: \ .self) { name in
                Text(name)
            }
            .padding()
            .background(Color.white)
            
            Button(action: {
                isShuffled
                ? (names.sort { $0.lowercased() < $1.lowercased() })
                : (names.shuffle())
                isShuffled.toggle()
            }) {
                Text(isShuffled ? "Sort Ascending" : "Shuffle")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
    var filteredNames: [String] {
        names.map { $0.capitalized }
            .filter { name in
                filterLetter.isEmpty || name.hasPrefix(filterLetter.capitalized)
            }
    }
}

#Preview {
    ContentView()
}
