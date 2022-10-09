// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import SchemaLib

public class GetAllLanguagesQuery: GraphQLQuery {
  public static let operationName: String = "GetAllLanguages"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query GetAllLanguages {
        languages {
          __typename
          name
          native
        }
      }
      """
    ))

  public init() {}

  public struct Data: SchemaLib.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { SchemaLib.Objects.Query }
    public static var __selections: [Selection] { [
      .field("languages", [Language].self),
    ] }

    public var languages: [Language] { __data["languages"] }

    /// Language
    ///
    /// Parent Type: `Language`
    public struct Language: SchemaLib.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { SchemaLib.Objects.Language }
      public static var __selections: [Selection] { [
        .field("name", String?.self),
        .field("native", String?.self),
      ] }

      public var name: String? { __data["name"] }
      public var native: String? { __data["native"] }
    }
  }
}
