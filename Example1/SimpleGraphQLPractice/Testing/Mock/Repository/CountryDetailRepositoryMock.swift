//
//  CountryDetailRepositoryMock.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/25.
//

import Foundation

// MARK: - CountryDetailRepositoryMock

final class CountryDetailRepositorySuccessMock: CountryDetailRepository {

    // MARK: - Function

    func getCountry(code: String) async throws -> CountryDetailEntity? {
        CountryDetailSeeder.default
    }
}

final class CountryDetailRepositoryFailureMock: CountryDetailRepository {

    // MARK: - Function

    func getCountry(code: String) async throws -> CountryDetailEntity? {
        throw MockError.with()
    }
}
