//
//  GetCountryByCodeRequest.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/23.
//

import Apollo
import Foundation

protocol GetCountryByCodeRequest {
    func getResultBy(code: String) async throws -> GraphQLResult<CountriesSchema.GetCountryByCodeQuery.Data>
}

final class GetCountryByCodeRequestImpl: GetCountryByCodeRequest {

    // MARK: - Property

    private let apolloClient: ApolloClient

    // MARK: - Initializer

    init(apolloClient: ApolloClient = GraphQLClient.shared.apollo) {
        self.apolloClient = apolloClient
    }

    // MARK: - Function

    func getResultBy(code: String) async throws -> GraphQLResult<CountriesSchema.GetCountryByCodeQuery.Data> {
        let query = CountriesSchema.GetCountryByCodeQuery(code: code)
        return try await apolloClient.fetchAsync(query: query)
    }
}
