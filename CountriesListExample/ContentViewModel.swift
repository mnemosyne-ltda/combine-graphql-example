import Combine
import Foundation
import CountriesListLib

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var continents = [String]()
        @Published var errors = [String]()

        private let repository: ServerRepositoryProtocol = GraphQLRepository()

        var repositoryFetchPublisher = PassthroughSubject<Void, Never>()
        var continentsSubscriber: AnyCancellable?
        var errorsSubscriber: AnyCancellable?

        init() {
            let publisher = repositoryFetchPublisher.map { _ -> AnyPublisher<[String], ServerError> in
                return self.repository.fetchAllContinents()
            }.switchToLatest()

            continentsSubscriber = publisher.catch { error in
                return Just([String]())
            }
            .receive(on: RunLoop.main)
            .assign(to: \.continents, on: self)

            // You can move .catch logic to contintents .catch
            // and set self.errors manually instead of using
            // another subscriber
            errorsSubscriber = publisher.map { _ in
                return []
            }.catch { serverError in
                var errors = [String]()
                switch serverError {
                case .graphQLError(let e):
                    errors = e
                case .networkError(let e):
                    errors = [e]
                case .unknown:
                    errors = ["unknown error"]
                }

                return Just(errors)
            }
            .receive(on: RunLoop.main)
            .assign(to: \.errors, on: self)
        }

        func updateContinents() {
            repositoryFetchPublisher.send()
        }

    }
}
