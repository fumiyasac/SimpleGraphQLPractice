//
//  CountryByCodeRequestMock.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/24.
//

import Apollo
import Foundation

// MARK: - CountryByCodeRequestMock

final class CountryByCodeRequestSuccessMock: CountryByCodeRequest {

    // MARK: - Function

    func getResultBy(code: String) async throws -> GraphQLResult<CountriesSchema.GetCountryByCodeQuery.Data> {
        //
        //
        //
        let dataDict = DataDict(
            data: [
                "country": DataDict(
                    data: [
                        "code": "JP",
                        "name": "Japan",
                        "emoji": "🇯🇵",
                        "phone": "81",
                        "native": "日本",
                        "awsRegion": "ap-northeast-1",
                        "continent": DataDict(
                            data: [
                                "code": "AS",
                                "name": "Asia"
                            ],
                            fulfilledFragments: []
                        ),
                        "languages": [
                            DataDict(
                                data: [
                                    "code": "ja",
                                    "name": "Japanese"
                                ],
                                fulfilledFragments: []
                            )
                        ],
                        "currencies": [
                            "JPY"
                        ]
                    ],
                    fulfilledFragments: []
                )
            ],
            fulfilledFragments: []
        )
        let data = CountriesSchema.GetCountryByCodeQuery.Data.init(_dataDict: dataDict)
        return GraphQLResult(data: data, extensions: [:], errors: nil, source: .server, dependentKeys: nil)
    }
}

final class CountryByCodeRequestFailureMock: CountryByCodeRequest {

    // MARK: - Function

    func getResultBy(code: String) async throws -> GraphQLResult<CountriesSchema.GetCountryByCodeQuery.Data> {
        throw MockError.with()
    }
}
