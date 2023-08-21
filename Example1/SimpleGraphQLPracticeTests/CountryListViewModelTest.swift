//
//  CountryListViewModelTest.swift
//  SimpleGraphQLPracticeTests
//
//  Created by 酒井文也 on 2023/08/20.
//

@testable import SimpleGraphQLPractice

import Combine
import Nimble
import Quick
import XCTest

// MARK: - UnitTest

final class CountryListViewModelTest: QuickSpec {

    // MARK: - Override

    override class func spec() {
        
        // MARK: - TestCase

        describe("#国一覧データ取得が成功する場合のテストケース") {

            // データ取得成功時のMockをViewModel初期化時に適用する
            let viewModel: CountryListViewModel = CountryListViewModel(
                countryListRepository: CountryListRepositorySuccessMock()
            )

            context("GraphQLでのデータ取得処理が成功した場合") {
                viewModel.fetchCountryList()

                it("Seedデータで定義したレスポンス値が返却＆成功ステータスが返却されること") {
                    expect(viewModel.requestStatus)
                        .toEventually(equal(.success))
                    expect(viewModel.countryListEntities)
                        .toEventually(equal(CountryListSeeder.default))
                    expect(viewModel.countryListEntities.count)
                        .toEventually(equal(5))
                }
            }
        }

        // MARK: - TestCase

        describe("#国一覧データ取得が失敗する場合のテストケース") {

            // エラー発生時のMockをViewModel初期化時に適用する
            let viewModel: CountryListViewModel = CountryListViewModel(
                countryListRepository: CountryListRepositoryFailureMock()
            )
            context("GraphQLでのデータ取得処理が失敗した場合") {
                viewModel.fetchCountryList()

                it("空配列が返却＆失敗ステータスが返却されること") {
                    expect(viewModel.requestStatus)
                        .toEventually(equal(.failure))
                    expect(viewModel.countryListEntities)
                        .toEventually(equal([]))
                    expect(viewModel.countryListEntities.count)
                        .toEventually(equal(0))
                }
            }
        }

    }
}
