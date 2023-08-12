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

    private let countryListRequest: CountryListRequest

    // MARK: - Initializer

    init(countryListRequest: CountryListRequest = CountryListRequestImpl()) {
        self.countryListRequest = countryListRequest
    }

    // MARK: - Function

    func getAllCountries() async throws -> [CountryListEntity] {
        let result = try await countryListRequest.getResult()
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
