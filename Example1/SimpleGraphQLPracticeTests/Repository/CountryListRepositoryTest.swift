//
//  CountryListRepositoryTest.swift
//  SimpleGraphQLPracticeTests
//
//  Created by 酒井文也 on 2023/08/22.
//

@testable import SimpleGraphQLPractice

import Nimble
import Quick
import XCTest

// MARK: - UnitTest

// MEMO: async/awaitのテストをする場合
// 👉 AsyncSpecクラスを継承する点がポイント
final class CountryListRepositoryTest: AsyncSpec {

    // MARK: - Override

    override class func spec() {

        // MARK: - TestCase

        // 👉 getAllCountries() は async throws で定義したメソッドなので、await expect を利用することになります。
        // https://github.com/Quick/Nimble/blob/main/README.md#asyncawait-support
        describe("#国一覧データ取得をする場合のテストケース") {
            context("GraphQLでのデータ取得処理が成功した場合") {
                // データ取得成功時のMockをRepository初期化時に適用する
                let repository: CountryListRepository = CountryListRepositoryImpl(
                    countryListRequest: CountryListRequestSuccessMock()
                )
                it("想定しているレスポンス値と返却値が一致すること") {
                    // 正常処理時はGraphQLでのデータをEntityにマッピングできることが確認できれば良い
                    await expect { try await repository.getAllCountries() }
                        .to(equal(CountryListSeeder.default))
                }
            }
            context("GraphQLでのデータ取得処理が失敗した場合") {
                // データ取得失敗時のMockをRepository初期化時に適用する
                let repository: CountryListRepository = CountryListRepositoryImpl(
                    countryListRequest: CountryListRequestFailureMock()
                )
                it("想定しているレスポンス値と返却値が一致しないこと") {
                    // 失敗時は throw でエラーが投げられることを確認できれば良い
                    await expect { try await repository.getAllCountries() }
                        .to(throwError())
                }
            }
        }

    }
}
