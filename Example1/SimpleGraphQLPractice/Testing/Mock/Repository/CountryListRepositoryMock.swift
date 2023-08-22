//
//  CountryListRepositoryMock.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/22.
//

import Foundation

// MARK: - CountryListRepositoryMock

final class CountryListRepositorySuccessMock: CountryListRepository {

    // MARK: - Function

    func getAllCountries() async throws -> [CountryListEntity] {
        CountryListSeeder.default
    }
}

final class CountryListRepositoryFailureMock: CountryListRepository {

    // MARK: - Function

    func getAllCountries() async throws -> [CountryListEntity] {
        throw MockError.with()
    }
}
