// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SchemaLib

public class Query: MockObject {
  public static let objectType: Object = SchemaLib.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<[Continent]>("continents") public var continents
    @Field<[Country]>("countries") public var countries
    @Field<[Language]>("languages") public var languages
  }
}

public extension Mock where O == Query {
  convenience init(
    continents: [Mock<Continent>]? = nil,
    countries: [Mock<Country>]? = nil,
    languages: [Mock<Language>]? = nil
  ) {
    self.init()
    self.continents = continents
    self.countries = countries
    self.languages = languages
  }
}
