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
        // MEMO: Apollo1.x系からはGraphQLで返却されるデータをUnitTest用にマッピングする際には注意が必要（構造が複雑になりがち）
        // 一覧データのMock生成時の流れ
        // (1) まずDataDict型（第1引数は[String: AnyHashable]型、第2引数はから配列）のデータを作成してレスポンスデータを想定してマッピングをする
        // (2) 次にCountriesSchema.GetAllCountriesQuery.Data型のデータを作成してGraphQLResultに入れて返却する
        let dataDict = DataDict(
            data: [
                "countries": [
                    DataDict(data: ["code": "MY", "name": "Malaysia", "emoji": "🇲🇾"], fulfilledFragments: []),
                    DataDict(data: ["code": "TH", "name": "Thailand", "emoji": "🇹🇭"], fulfilledFragments: []),
                    DataDict(data: ["code": "MX", "name": "Mexico", "emoji": "🇲🇽"], fulfilledFragments: []),
                    DataDict(data: ["code": "JP", "name": "Japan", "emoji": "🇯🇵"], fulfilledFragments: []),
                    DataDict(data: ["code": "IN", "name": "India", "emoji": "🇮🇳"], fulfilledFragments: [])
                ]
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
