//
//  CountryDetailRepositoryTest.swift
//  SimpleGraphQLPracticeTests
//
//  Created by 酒井文也 on 2023/08/24.
//

@testable import SimpleGraphQLPractice

import Nimble
import Quick
import XCTest

// MARK: - UnitTest

// MEMO: async/awaitのテストをする場合
// 👉 AsyncSpecクラスを継承する点がポイント
final class CountryDetailRepositoryTest: AsyncSpec {

    // MARK: - Override

    override class func spec() {

        // MARK: - TestCase

        // 👉 getCountry() は async throws で定義したメソッドなので、await expect を利用することになります。
        // https://github.com/Quick/Nimble/blob/main/README.md#asyncawait-support
        describe("#国詳細データ取得をする場合のテストケース") {
            context("GraphQLでのデータ取得処理が成功した場合") {
                // データ取得成功時のMockをRepository初期化時に適用する
                let repository: CountryDetailRepository = CountryDetailRepositoryImpl(
                    countryByCodeRequest: CountryByCodeRequestSuccessMock()
                )
                it("想定しているレスポンス値と返却値が一致すること") {
                    // 正常処理時はGraphQLでのデータをEntityにマッピングできることが確認できれば良い
                    await expect { try await repository.getCountry(code: "JP") }
                        .to(equal(CountryDetailSeeder.default))
                }
            }
            context("GraphQLでのデータ取得処理が失敗した場合") {
                // データ取得失敗時のMockをRepository初期化時に適用する
                let repository: CountryDetailRepository = CountryDetailRepositoryImpl(
                    countryByCodeRequest: CountryByCodeRequestFailureMock()
                )
                it("想定しているレスポンス値と返却値が一致しないこと") {
                    // 失敗時は throw でエラーが投げられることを確認できれば良い
                    await expect { try await repository.getCountry(code: "JP") }
                        .to(throwError())
                }
            }
        }

    }
}
