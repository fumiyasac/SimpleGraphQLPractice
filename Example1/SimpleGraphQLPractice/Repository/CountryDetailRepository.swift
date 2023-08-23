//
//  CountryDetailRepository.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/23.
//

import Apollo
import Foundation

// MARK: - Protocol

protocol CountryDetailRepository {
    func getCountry(code: String) async throws -> CountryDetailEntity?
}

final class CountryDetailRepositoryImpl: CountryDetailRepository {

    // MARK: - Property

    private let countryByCodeRequest: CountryByCodeRequest

    // MARK: - Initializer

    init(countryByCodeRequest: CountryByCodeRequest = CountryByCodeRequestImpl()) {
        self.countryByCodeRequest = countryByCodeRequest
    }

    // MARK: - Function

    func getCountry(code: String) async throws -> CountryDetailEntity? {
        let result = try await countryByCodeRequest.getResultBy(code: code)
        return convertToEntities(result: result)
    }

    // MARK: - Private Function

    private func convertToEntities(result: GraphQLResult<CountriesSchema.GetCountryByCodeQuery.Data>) -> CountryDetailEntity? {
        guard let country = result.data?.country else {
            return nil
        }
        return CountryDetailEntity(
            code: country.code,
            name: country.name,
            emoji: country.emoji,
            phone: country.phone,
            native: country.native,
            awsRegion: country.awsRegion,
            continent: CountryDetailContinentEntity(code: country.continent.code, name: country.continent.name),
            languages: country.languages.compactMap {
                CountryDetailLanguageEntity(code: $0.code, name: $0.name)
            },
            currencies: country.currencies.joined(separator: ","),
            subdivisions: country.languages.compactMap {
                CountryDetailSubdivisionEntity(code: $0.code, name: $0.name)
            }
        )
    }
}
