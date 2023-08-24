//
//  CountryDetailViewModel.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/25.
//

import Foundation

final class CountryDetailViewModel: ObservableObject {

    // MARK: - Property

    private let countryDetailRepository: CountryDetailRepository

    @Published private(set) var countryDetailEntity: CountryDetailEntity? = nil
    @Published private(set) var requestStatus: RequestStatus = .none

    // MARK: - Initializer

    init(countryDetailRepository: CountryDetailRepository = CountryDetailRepositoryImpl()) {
        self.countryDetailRepository = countryDetailRepository
    }

    // MARK: - Function

    func fetchCountry(code: String) {
        Task { @MainActor in
            self.requestStatus = .requesting
            do {
                // MEMO: async/awaitベースの処理で必要な値を取得し、その後`@Published`で定義した値を更新する
                self.countryDetailEntity = try await self.countryDetailRepository.getCountry(code: code)
                self.requestStatus = .success
            } catch let error {
                // MEMO: 本来ならばエラーハンドリング処理等を入れる必要がある
                print("Fetch Country Detail Error: " + error.localizedDescription)
                self.requestStatus = .failure
            }
        }
    }
}
