//
//  CountryListViewModelTest.swift
//  SimpleGraphQLPracticeTests
//
//  Created by 酒井文也 on 2023/08/20.
//

@testable import SimpleGraphQLPractice

import Combine
import CombineExpectations
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

            // MEMO: このサンプルでは`@Published`を利用しているViewModelクラスの変数を記録対象とする
            var requestStatusRecorder: Recorder<RequestStatus, Never>!
            var countryListEntitiesRecorder: Recorder<[CountryListEntity], Never>!

            context("GraphQLでのデータ取得処理が成功した場合") {

                // テスト前＆テスト後の記録対象変数に関する準備
                beforeEach {
                    requestStatusRecorder = viewModel.$requestStatus.record()
                    countryListEntitiesRecorder = viewModel.$countryListEntities.record()
                }
                afterEach {
                    requestStatusRecorder = nil
                    countryListEntitiesRecorder = nil
                }

                it("Seedデータで定義したレスポンス値が返却＆成功ステータスが返却されること") {

                    // 対象のViewModel側の処理を実行する
                    viewModel.fetchCountryList()
                    // timeout部分で0.16秒後の変化を見る
                    // 👉 `@Published`の記録結果を取得する際に「CombineExpectation」が提供している.waitを利用するが、self.current.wait(...)とする必要があった。
                    let requestStatusRecorderResult = try! self.current.wait(
                        for: requestStatusRecorder.availableElements,
                        timeout: 0.16
                    )
                    let countryListEntitiesRecorderResult = try! self.current.wait(
                        for: countryListEntitiesRecorder.availableElements,
                        timeout: 0.16
                    )
                    // 値変化の変遷が意図した物であることを確認する
                    expect(requestStatusRecorderResult).to(equal([.none, .requesting, .success]))
                    expect(countryListEntitiesRecorderResult).to(equal([[], CountryListSeeder.default]))

                    // MEMO: 最終的な結果のみが必要な場合は下記の様に記載してもOK
                    /*
                    expect(viewModel.requestStatus)
                        .toEventually(equal(.success))
                    expect(viewModel.countryListEntities)
                        .toEventually(equal(CountryListSeeder.default))
                    expect(viewModel.countryListEntities.count)
                        .toEventually(equal(5))
                    */
                }
            }
        }

        // MARK: - TestCase

        describe("#国一覧データ取得が失敗する場合のテストケース") {

            // エラー発生時のMockをViewModel初期化時に適用する
            let viewModel: CountryListViewModel = CountryListViewModel(
                countryListRepository: CountryListRepositoryFailureMock()
            )

            // MEMO: このサンプルでは`@Published`を利用しているViewModelクラスの変数を記録対象とする
            var requestStatusRecorder: Recorder<RequestStatus, Never>!
            var countryListEntitiesRecorder: Recorder<[CountryListEntity], Never>!
            
            context("GraphQLでのデータ取得処理が失敗した場合") {

                // テスト前＆テスト後の記録対象変数に関する準備
                beforeEach {
                    requestStatusRecorder = viewModel.$requestStatus.record()
                    countryListEntitiesRecorder = viewModel.$countryListEntities.record()
                }
                afterEach {
                    requestStatusRecorder = nil
                    countryListEntitiesRecorder = nil
                }

                it("空配列が返却＆失敗ステータスが返却されること") {

                    // 対象のViewModel側の処理を実行する
                    viewModel.fetchCountryList()
                    // timeout部分で0.16秒後の変化を見る
                    // 👉 `@Published`の記録結果を取得する際に「CombineExpectation」が提供している.waitを利用するが、self.current.wait(...)とする必要があった。
                    let requestStatusRecorderResult = try! self.current.wait(
                        for: requestStatusRecorder.availableElements,
                        timeout: 0.16
                    )
                    let countryListEntitiesRecorderResult = try! self.current.wait(
                        for: countryListEntitiesRecorder.availableElements,
                        timeout: 0.16
                    )
                    // 値変化の変遷が意図した物であることを確認する
                    expect(requestStatusRecorderResult).to(equal([.none, .requesting, .failure]))
                    expect(countryListEntitiesRecorderResult).to(equal([[]]))

                    // MEMO: 最終的な結果のみが必要な場合は下記の様に記載してもOK
                    /*
                    expect(viewModel.requestStatus)
                        .toEventually(equal(.failure))
                    expect(viewModel.countryListEntities)
                        .toEventually(equal([]))
                    expect(viewModel.countryListEntities.count)
                        .toEventually(equal(0))
                    */
                }
            }
        }

    }
}
