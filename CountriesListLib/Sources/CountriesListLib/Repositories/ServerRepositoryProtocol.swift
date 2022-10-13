import Combine
import Foundation

public enum ServerError: Error, LocalizedError {
    case graphQLError([String])
    case networkError(String)
    case unknown
}

public protocol ServerRepositoryProtocol {
    func fetchAllContinents() -> AnyPublisher<[String], ServerError>
}
