// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension CountriesSchema {
  class GetCountryByCodeQuery: GraphQLQuery {
    static let operationName: String = "GetCountryByCode"
    static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetCountryByCode($code: ID!) {
          country(code: $code) {
            __typename
            code
            name
            emoji
            phone
            native
            awsRegion
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
            currencies
            subdivisions {
              __typename
              code
              name
            }
          }
        }
        """#
      ))

    public var code: ID

    public init(code: ID) {
      self.code = code
    }

    public var __variables: Variables? { ["code": code] }

    struct Data: CountriesSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("country", Country?.self, arguments: ["code": .variable("code")]),
      ] }

      var country: Country? { __data["country"] }

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
          .field("phone", String.self),
          .field("native", String.self),
          .field("awsRegion", String.self),
          .field("continent", Continent.self),
          .field("languages", [Language].self),
          .field("currencies", [String].self),
          .field("subdivisions", [Subdivision].self),
        ] }

        var code: CountriesSchema.ID { __data["code"] }
        var name: String { __data["name"] }
        var emoji: String { __data["emoji"] }
        var phone: String { __data["phone"] }
        var native: String { __data["native"] }
        var awsRegion: String { __data["awsRegion"] }
        var continent: Continent { __data["continent"] }
        var languages: [Language] { __data["languages"] }
        var currencies: [String] { __data["currencies"] }
        var subdivisions: [Subdivision] { __data["subdivisions"] }

        /// Country.Continent
        ///
        /// Parent Type: `Continent`
        struct Continent: CountriesSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Continent }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("code", CountriesSchema.ID.self),
            .field("name", String.self),
          ] }

          var code: CountriesSchema.ID { __data["code"] }
          var name: String { __data["name"] }
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
            .field("name", String.self),
            .field("code", CountriesSchema.ID.self),
          ] }

          var name: String { __data["name"] }
          var code: CountriesSchema.ID { __data["code"] }
        }

        /// Country.Subdivision
        ///
        /// Parent Type: `Subdivision`
        struct Subdivision: CountriesSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Subdivision }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("code", CountriesSchema.ID.self),
            .field("name", String.self),
          ] }

          var code: CountriesSchema.ID { __data["code"] }
          var name: String { __data["name"] }
        }
      }
    }
  }

}