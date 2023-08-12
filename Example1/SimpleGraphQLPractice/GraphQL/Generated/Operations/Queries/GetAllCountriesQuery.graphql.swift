// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension CountriesSchema {
  class GetAllCountriesQuery: GraphQLQuery {
    static let operationName: String = "GetAllCountries"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetAllCountries { countries { __typename code name emoji } }"#
      ))

    public init() {}

    struct Data: CountriesSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("countries", [Country].self),
      ] }

      var countries: [Country] { __data["countries"] }

      /// Country
      ///
      /// Parent Type: `Country`
      struct Country: CountriesSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Country }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", CountriesSchema.ID.self),
          .field("name", String.self),
          .field("emoji", String.self),
        ] }

        var code: CountriesSchema.ID { __data["code"] }
        var name: String { __data["name"] }
        var emoji: String { __data["emoji"] }
      }
    }
  }

}