// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension MenuExhibitionSchema {
  class GetAllNewsQuery: GraphQLQuery {
    static let operationName: String = "getAllNews"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query getAllNews { getNews { __typename id title date genre } }"#
      ))

    public init() {}

    struct Data: MenuExhibitionSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { MenuExhibitionSchema.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("getNews", [GetNews]?.self),
      ] }

      var getNews: [GetNews]? { __data["getNews"] }

      /// GetNews
      ///
      /// Parent Type: `News`
      struct GetNews: MenuExhibitionSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { MenuExhibitionSchema.Objects.News }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", MenuExhibitionSchema.ID.self),
          .field("title", String.self),
          .field("date", String.self),
          .field("genre", String.self),
        ] }

        var id: MenuExhibitionSchema.ID { __data["id"] }
        var title: String { __data["title"] }
        var date: String { __data["date"] }
        var genre: String { __data["genre"] }
      }
    }
  }

}