// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol CountriesSchema_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == CountriesSchema.SchemaMetadata {}

public protocol CountriesSchema_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == CountriesSchema.SchemaMetadata {}

public protocol CountriesSchema_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == CountriesSchema.SchemaMetadata {}

public protocol CountriesSchema_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == CountriesSchema.SchemaMetadata {}

public extension CountriesSchema {
  typealias ID = String

  typealias SelectionSet = CountriesSchema_SelectionSet

  typealias InlineFragment = CountriesSchema_InlineFragment

  typealias MutableSelectionSet = CountriesSchema_MutableSelectionSet

  typealias MutableInlineFragment = CountriesSchema_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return CountriesSchema.Objects.Query
      case "Country": return CountriesSchema.Objects.Country
      case "Continent": return CountriesSchema.Objects.Continent
      case "Language": return CountriesSchema.Objects.Language
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}