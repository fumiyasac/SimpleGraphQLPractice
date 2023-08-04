// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension CountriesSchema {
  class GetAllCountriesQuery: GraphQLQuery {
    public static let operationName: String = "GetAllCountries"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
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
            native
            currency
            emoji
            phone
          }
        }
        """#
      ))

    public init() {}

    public struct Data: CountriesSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("countries", [Country?]?.self),
      ] }

      public var countries: [Country?]? { __data["countries"] }

      /// Country
      ///
      /// Parent Type: `Country`
      public struct Country: CountriesSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Country }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", String?.self),
          .field("continent", Continent?.self),
          .field("languages", [Language?]?.self),
          .field("name", String?.self),
          .field("native", String?.self),
          .field("currency", String?.self),
          .field("emoji", String?.self),
          .field("phone", String?.self),
        ] }

        public var code: String? { __data["code"] }
        public var continent: Continent? { __data["continent"] }
        public var languages: [Language?]? { __data["languages"] }
        public var name: String? { __data["name"] }
        public var native: String? { __data["native"] }
        public var currency: String? { __data["currency"] }
        public var emoji: String? { __data["emoji"] }
        public var phone: String? { __data["phone"] }

        /// Country.Continent
        ///
        /// Parent Type: `Continent`
        public struct Continent: CountriesSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Continent }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("code", String?.self),
            .field("name", String?.self),
          ] }

          public var code: String? { __data["code"] }
          public var name: String? { __data["name"] }
        }

        /// Country.Language
        ///
        /// Parent Type: `Language`
        public struct Language: CountriesSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { CountriesSchema.Objects.Language }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String?.self),
            .field("code", String?.self),
          ] }

          public var name: String? { __data["name"] }
          public var code: String? { __data["code"] }
        }
      }
    }
  }

}