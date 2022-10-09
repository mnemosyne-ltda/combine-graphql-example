// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import SchemaLib

public class GetAllContinentsQuery: GraphQLQuery {
  public static let operationName: String = "GetAllContinents"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query GetAllContinents {
        continents {
          __typename
          name
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
      .field("continents", [Continent].self),
    ] }

    public var continents: [Continent] { __data["continents"] }

    /// Continent
    ///
    /// Parent Type: `Continent`
    public struct Continent: SchemaLib.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { SchemaLib.Objects.Continent }
      public static var __selections: [Selection] { [
        .field("name", String.self),
      ] }

      public var name: String { __data["name"] }
    }
  }
}
