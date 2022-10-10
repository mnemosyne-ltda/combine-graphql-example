import Foundation
import Apollo
import SchemaLib

public struct CountriesListLib {
    public private(set) var text = "Hello, World!"
    private let apolloClient: ApolloClient

    public init() {
        let url = URL(string: "https://countries.trevorblades.com")!
        apolloClient = ApolloClient(url: url)
    }

    public func fetchContinents(callback: @escaping ([String]) -> Void) {
        let query = GetAllContinentsQuery()
        apolloClient.fetch(query: query) { result in
            guard let data = try? result.get().data else {
                print("Could not fetch data")
                return
            }

            let continents = data.continents.map { $0.name }
            callback(continents)
        }
    }
}
