//
//  ContentView.swift
//  CountriesListExample
//
//  Created by Djenifer Renata Pereira on 09/10/22.
//

import SwiftUI
import Factory
import CountriesListLib

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Button("Run") { viewModel.updateContinents() }
                .padding(.bottom)

            getHeader(text1: "Continents", text2: "\(viewModel.continents.count)")
            Divider()

            ForEach(viewModel.continents, id: \.self) { c in
                Text(c)
            }

            getHeader(text1: "Erros", text2: "\(viewModel.errors.count)")
                .padding(.top, 20)
            Divider()

            ForEach(viewModel.errors, id: \.self) { e in
                Text(e)
            }

            Spacer()
        }
        .padding()
    }

    @ViewBuilder func getHeader(text1: String, text2: String) -> some View {
        HStack {
            Text(text1).bold()
            Spacer()
            Text(text2).bold()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var mockRepository = MockedRepository(
        resultCase: .error(.unknown)
        // resultCase: .success(["Continent 1", "Continent 2"])
    )

    static var previews: some View {
        let _ = Container.serverRepository.register { mockRepository }
        ContentView()
    }
}
