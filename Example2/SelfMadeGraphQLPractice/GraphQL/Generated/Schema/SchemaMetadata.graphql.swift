// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol MenuExhibitionSchema_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == MenuExhibitionSchema.SchemaMetadata {}

protocol MenuExhibitionSchema_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == MenuExhibitionSchema.SchemaMetadata {}

protocol MenuExhibitionSchema_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == MenuExhibitionSchema.SchemaMetadata {}

protocol MenuExhibitionSchema_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == MenuExhibitionSchema.SchemaMetadata {}

extension MenuExhibitionSchema {
  typealias ID = String

  typealias SelectionSet = MenuExhibitionSchema_SelectionSet

  typealias InlineFragment = MenuExhibitionSchema_InlineFragment

  typealias MutableSelectionSet = MenuExhibitionSchema_MutableSelectionSet

  typealias MutableInlineFragment = MenuExhibitionSchema_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Mutation": return MenuExhibitionSchema.Objects.Mutation
      case "Inquire": return MenuExhibitionSchema.Objects.Inquire
      case "Query": return MenuExhibitionSchema.Objects.Query
      case "Menu": return MenuExhibitionSchema.Objects.Menu
      case "News": return MenuExhibitionSchema.Objects.News
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}