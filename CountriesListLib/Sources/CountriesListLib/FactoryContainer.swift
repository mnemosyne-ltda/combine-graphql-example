import Apollo
import Factory
import Foundation

extension Container {
    public static let serverRepository = Factory<ServerRepositoryProtocol> { GraphQLRepository() }
}
