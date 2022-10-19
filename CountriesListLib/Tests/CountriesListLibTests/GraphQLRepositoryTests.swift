import XCTest
import SchemaLibTestMocks
import ApolloTestSupport
@testable import CountriesListLib

class GraphQLRepositoryTests: XCTestCase {

    // This test is not mocking ApolloClient
    func testGetAllContinentsQueryShouldReturnAllNames() {
        let expectation = XCTestExpectation()
        let repository = GraphQLRepository()
        let publisher = repository.fetchAllContinents()
            .sink { fini in
                print(".sink() received the completion")
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            } receiveValue: { names in
                print(names)
                XCTAssertEqual(names.count, 5 + 2) // America -> North America, South America
            }

        XCTAssertNotNil(publisher)
        wait(for: [expectation], timeout: 5.0)
    }
}
