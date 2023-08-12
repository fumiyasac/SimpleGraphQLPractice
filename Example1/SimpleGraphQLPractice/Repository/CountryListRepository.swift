//
//  CountriesRepository.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/09.
//

import Apollo
import Foundation

// MARK: - Protocol

protocol CountryListRepository {
    func getAllCountries() async throws -> [CountryListEntity]
}

final class CountryListRepositoryImpl: CountryListRepository {

    // MARK: - Property

    private let apolloClient: ApolloClient

    // MARK: - Initializer

    init(apolloClient: ApolloClient = GraphQLClient.shared.apollo) {
        self.apolloClient = apolloClient
    }

    // MARK: - Function

    func getAllCountries() async throws -> [CountryListEntity] {
        let query = CountriesSchema.GetAllCountriesQuery()
        let result = try await apolloClient.fetchAsync(query: query)
        return convertToEntities(result: result)
    }

    // MARK: - Private Function

    private func convertToEntities(result: GraphQLResult<CountriesSchema.GetAllCountriesQuery.Data>) -> [CountryListEntity] {
        result.data?.countries.compactMap {
            CountryListEntity(
                code: $0.code,
                name: $0.name,
                emoji: $0.emoji
            )
        } ?? []
    }
}
