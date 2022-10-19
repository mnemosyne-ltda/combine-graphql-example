// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SchemaLib

public class Country: MockObject {
  public static let objectType: Object = SchemaLib.Objects.Country
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Country>>

  public struct MockFields {
    @Field<String>("capital") public var capital
    @Field<String>("emoji") public var emoji
    @Field<String>("emojiU") public var emojiU
    @Field<String>("name") public var name
    @Field<String>("native") public var native
  }
}

public extension Mock where O == Country {
  convenience init(
    capital: String? = nil,
    emoji: String? = nil,
    emojiU: String? = nil,
    name: String? = nil,
    native: String? = nil
  ) {
    self.init()
    self.capital = capital
    self.emoji = emoji
    self.emojiU = emojiU
    self.name = name
    self.native = native
  }
}
