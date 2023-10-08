// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension MenuExhibitionSchema {
  class AddInquireMutation: GraphQLMutation {
    static let operationName: String = "addInquire"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation addInquire($title: String!, $purpose: String!, $text: String!) { addInquire(inquireItem: {title: $title, purpose: $purpose, text: $text}) { __typename id title purpose text } }"#
      ))

    public var title: String
    public var purpose: String
    public var text: String

    public init(
      title: String,
      purpose: String,
      text: String
    ) {
      self.title = title
      self.purpose = purpose
      self.text = text
    }

    public var __variables: Variables? { [
      "title": title,
      "purpose": purpose,
      "text": text
    ] }

    struct Data: MenuExhibitionSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { MenuExhibitionSchema.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("addInquire", AddInquire.self, arguments: ["inquireItem": [
          "title": .variable("title"),
          "purpose": .variable("purpose"),
          "text": .variable("text")
        ]]),
      ] }

      var addInquire: AddInquire { __data["addInquire"] }

      /// AddInquire
      ///
      /// Parent Type: `Inquire`
      struct AddInquire: MenuExhibitionSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { MenuExhibitionSchema.Objects.Inquire }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", MenuExhibitionSchema.ID.self),
          .field("title", String.self),
          .field("purpose", String.self),
          .field("text", String.self),
        ] }

        var id: MenuExhibitionSchema.ID { __data["id"] }
        var title: String { __data["title"] }
        var purpose: String { __data["purpose"] }
        var text: String { __data["text"] }
      }
    }
  }

}