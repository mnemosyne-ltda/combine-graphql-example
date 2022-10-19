// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SchemaLib

public class Language: MockObject {
  public static let objectType: Object = SchemaLib.Objects.Language
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Language>>

  public struct MockFields {
    @Field<String>("name") public var name
    @Field<String>("native") public var native
  }
}

public extension Mock where O == Language {
  convenience init(
    name: String? = nil,
    native: String? = nil
  ) {
    self.init()
    self.name = name
    self.native = native
  }
}
