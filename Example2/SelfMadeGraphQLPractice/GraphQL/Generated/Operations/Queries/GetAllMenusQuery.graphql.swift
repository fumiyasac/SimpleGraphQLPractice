// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension MenuExhibitionSchema {
  class GetAllMenusQuery: GraphQLQuery {
    static let operationName: String = "getAllMenus"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query getAllMenus($dishType: String, $categorySlug: String) { getMenus(menuFilter: { dishType: $dishType, categorySlug: $categorySlug }) { __typename id name dishType categorySlug price kcal thumbnail } }"#
      ))

    public var dishType: GraphQLNullable<String>
    public var categorySlug: GraphQLNullable<String>

    public init(
      dishType: GraphQLNullable<String>,
      categorySlug: GraphQLNullable<String>
    ) {
      self.dishType = dishType
      self.categorySlug = categorySlug
    }

    public var __variables: Variables? { [
      "dishType": dishType,
      "categorySlug": categorySlug
    ] }

    struct Data: MenuExhibitionSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { MenuExhibitionSchema.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("getMenus", [GetMenu]?.self, arguments: ["menuFilter": [
          "dishType": .variable("dishType"),
          "categorySlug": .variable("categorySlug")
        ]]),
      ] }

      var getMenus: [GetMenu]? { __data["getMenus"] }

      /// GetMenu
      ///
      /// Parent Type: `Menu`
      struct GetMenu: MenuExhibitionSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { MenuExhibitionSchema.Objects.Menu }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", MenuExhibitionSchema.ID.self),
          .field("name", String.self),
          .field("dishType", String.self),
          .field("categorySlug", String.self),
          .field("price", Int.self),
          .field("kcal", Int.self),
          .field("thumbnail", String.self),
        ] }

        var id: MenuExhibitionSchema.ID { __data["id"] }
        var name: String { __data["name"] }
        var dishType: String { __data["dishType"] }
        var categorySlug: String { __data["categorySlug"] }
        var price: Int { __data["price"] }
        var kcal: Int { __data["kcal"] }
        var thumbnail: String { __data["thumbnail"] }
      }
    }
  }

}