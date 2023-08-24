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
        // MEMO: Apollo1.x系からはGraphQLで返却されるデータをUnitTest用にマッピングする際には注意が必要（構造が複雑になりがち）
        // 一覧データのMock生成時の流れ
        // (1) まずDataDict型（第1引数は[String: AnyHashable]型、第2引数はから配列）のデータを作成してレスポンスデータを想定してマッピングをする
        // (2) 次にCountriesSchema.GetCountryByCodeQuery.Data型のデータを作成してGraphQLResultに入れて返却する
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
