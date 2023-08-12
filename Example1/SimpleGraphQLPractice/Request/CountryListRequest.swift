//
//  CountryListRequest.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/12.
//

import Apollo
import Foundation

protocol CountryListRequest {
    func getResult() async throws -> GraphQLResult<CountriesSchema.GetAllCountriesQuery.Data>
}

final class CountryListRequestImpl: CountryListRequest {

    // MARK: - Property

    private let apolloClient: ApolloClient

    // MARK: - Initializer

    init(apolloClient: ApolloClient = GraphQLClient.shared.apollo) {
        self.apolloClient = apolloClient
    }

    // MARK: - Function

    func getResult() async throws -> GraphQLResult<CountriesSchema.GetAllCountriesQuery.Data> {
        let query = CountriesSchema.GetAllCountriesQuery()
        return try await apolloClient.fetchAsync(query: query)
    }
}
