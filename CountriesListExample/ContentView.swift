//
//  ContentView.swift
//  CountriesListExample
//
//  Created by Djenifer Renata Pereira on 09/10/22.
//

import SwiftUI
import CountriesListLib

struct ContentView: View {
    let lib = CountriesListLib()
    @State var continents = [String]()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("libText: \(lib.text)")
            Divider()
            ForEach(continents, id: \.self) { c in
                Text(c)
            }
        }
        .padding()
        .onAppear {
            lib.fetchContinents { continents in
                self.continents = continents
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
