// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import SchemaLib

public class GetAllCountriesQuery: GraphQLQuery {
  public static let operationName: String = "GetAllCountries"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query GetAllCountries {
        countries {
          __typename
          name
          native
          emoji
          emojiU
          capital
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
      .field("countries", [Country].self),
    ] }

    public var countries: [Country] { __data["countries"] }

    /// Country
    ///
    /// Parent Type: `Country`
    public struct Country: SchemaLib.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { SchemaLib.Objects.Country }
      public static var __selections: [Selection] { [
        .field("name", String.self),
        .field("native", String.self),
        .field("emoji", String.self),
        .field("emojiU", String.self),
        .field("capital", String?.self),
      ] }

      public var name: String { __data["name"] }
      public var native: String { __data["native"] }
      public var emoji: String { __data["emoji"] }
      public var emojiU: String { __data["emojiU"] }
      public var capital: String? { __data["capital"] }
    }
  }
}
