// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension CountriesSchema {
  class GetAllCountriesQuery: GraphQLQuery {
    static let operationName: String = "GetAllCountries"
    static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetAllCountries {
          countries {
            __typename
            code
            continent {
              __typename
              code
              name
            }
            languages {
              __typename
              name
              code
            }
            name
            currency
            emoji
            phone
          }
        }
        """#
      ))

    public init() {}

    struct Data: CountriesSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("countries", [Country?]?.self),
      ] }

      var countries: [Country?]? { __data["countries"] }

      /// Country
      ///
      /// Parent Type: `Country`
      struct Country: CountriesSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Country }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", String?.self),
          .field("continent", Continent?.self),
          .field("languages", [Language?]?.self),
          .field("name", String?.self),
          .field("currency", String?.self),
          .field("emoji", String?.self),
          .field("phone", String?.self),
        ] }

        var code: String? { __data["code"] }
        var continent: Continent? { __data["continent"] }
        var languages: [Language?]? { __data["languages"] }
        var name: String? { __data["name"] }
        var currency: String? { __data["currency"] }
        var emoji: String? { __data["emoji"] }
        var phone: String? { __data["phone"] }

        /// Country.Continent
        ///
        /// Parent Type: `Continent`
        struct Continent: CountriesSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Continent }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("code", String?.self),
            .field("name", String?.self),
          ] }

          var code: String? { __data["code"] }
          var name: String? { __data["name"] }
        }

        /// Country.Language
        ///
        /// Parent Type: `Language`
        struct Language: CountriesSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Language }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String?.self),
            .field("code", String?.self),
          ] }

          var name: String? { __data["name"] }
          var code: String? { __data["code"] }
        }
      }
    }
  }

}