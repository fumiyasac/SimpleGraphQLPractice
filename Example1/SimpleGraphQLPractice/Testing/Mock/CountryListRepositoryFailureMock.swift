//
//  CountryListRepositoryFailureMock.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/22.
//

import Foundation

final class CountryListRepositoryFailureMock: CountryListRepository {

    // MARK: - Function

    func getAllCountries() async throws -> [CountryListEntity] {
        throw MockError.with()
    }
}
