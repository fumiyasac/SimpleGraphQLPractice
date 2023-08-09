//
//  CountriesRepository.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/09.
//

import Apollo
import Foundation

// MARK: - Protocol

protocol CountriesRepository {
    func getAllCountries() async throws -> [CountryListEntity]
}

final class CountriesRepositoryImpl: CountriesRepository {

    // MARK: - Property

    private let apolloClient: ApolloClient

    // MARK: - Initializer

    init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }

    // MARK: - Function

    func getAllCountries() async throws -> [CountryListEntity] {
        let query = CountriesSchema.GetAllCountriesQuery()
        let results = try await apolloClient.fetchAsync(query: query)
        return results.data?.countries.compactMap {
            CountryListEntity(
                code: $0.code,
                name: $0.name,
                emoji: $0.emoji
            )
        } ?? []
    }
}
