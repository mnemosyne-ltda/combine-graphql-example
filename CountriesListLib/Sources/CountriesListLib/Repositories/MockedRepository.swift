import Combine

public class MockedRepository: ServerRepositoryProtocol {
    private let resultCase: ResultCase

    public enum ResultCase {
        case success([String])
        case error(ServerError)
    }

    public init(resultCase: ResultCase) {
        self.resultCase = resultCase
    }

    public func fetchAllContinents() -> AnyPublisher<[String], ServerError> {
        switch resultCase {
        case .success(let array):
            return Just(array).setFailureType(to: ServerError.self).eraseToAnyPublisher()
        case .error(let serverError):
            return Fail(error: serverError).eraseToAnyPublisher()
        }
    }
}
