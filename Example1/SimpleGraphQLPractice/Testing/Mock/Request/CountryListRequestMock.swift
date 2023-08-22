//
//  CountryListRequestMock.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/22.
//

import Apollo
import Foundation

// MARK: - CountryListRepositoryMock

final class CountryListRequestSuccessMock: CountryListRequest {

    // MARK: - Function

    func getResult() async throws -> GraphQLResult<CountriesSchema.GetAllCountriesQuery.Data> {
        //
        //
        //
        let dataDict = DataDict(
            data: [
                "countries": AnyHashable([
                    DataDict(data: ["code": "MY", "name": "Malaysia", "emoji": "🇲🇾"], fulfilledFragments: []),
                    DataDict(data: ["code": "TH", "name": "Thailand", "emoji": "🇹🇭"], fulfilledFragments: []),
                    DataDict(data: ["code": "MX", "name": "Mexico", "emoji": "🇲🇽"], fulfilledFragments: []),
                    DataDict(data: ["code": "JP", "name": "Japan", "emoji": "🇯🇵"], fulfilledFragments: []),
                    DataDict(data: ["code": "IN", "name": "India", "emoji": "🇮🇳"], fulfilledFragments: [])
                ])
            ],
            fulfilledFragments: []
        )
        let data = CountriesSchema.GetAllCountriesQuery.Data.init(_dataDict: dataDict)
        return GraphQLResult(data: data, extensions: [:], errors: nil, source: .server, dependentKeys: nil)
    }
}

final class CountryListRequestFailureMock: CountryListRequest {

    // MARK: - Function

    func getResult() async throws -> GraphQLResult<CountriesSchema.GetAllCountriesQuery.Data> {
        throw MockError.with()
    }
}
