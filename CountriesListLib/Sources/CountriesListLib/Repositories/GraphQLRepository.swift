import Apollo
import Combine
import Foundation

public class GraphQLRepository: ServerRepositoryProtocol {
    private let url = URL(string: "https://countries.trevorblades.com")!
    private lazy var apolloClient = ApolloClient(url: url)

    public init() {}

    public func fetchAllContinents() -> AnyPublisher<[String], ServerError> {
        return Future<[String], ServerError> { [apolloClient] promise in
            apolloClient.fetch(query: GetAllContinentsQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    if let continent = graphQLResult.data?.continents {
                        promise(.success(continent.map { $0.name }))
                    } else if let errors = graphQLResult.errors {
                        let messages = errors.compactMap { $0.message }
                        promise(.failure(.graphQLError(messages)))
                    } else {
                        promise(.failure(.unknown))
                    }
                case .failure(let error):
                    promise(.failure(.networkError(error.localizedDescription)))
                }
            }
        }.eraseToAnyPublisher()
    }
}
