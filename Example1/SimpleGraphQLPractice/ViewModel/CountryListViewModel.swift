//
//  CountryListViewModel.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/12.
//

import Foundation

enum RequestStatus {
    case requesting
    case success
    case failure
    case none
}

final class CountryListViewModel: ObservableObject {
    
    // MARK: - Property
    
    private let countryListRepository: CountryListRepository

    @Published private(set) var countryListEntities: [CountryListEntity] = []
    @Published private(set) var requestStatus: RequestStatus = .none

    // MARK: - Initializer

    init(countryListRepository: CountryListRepository = CountryListRepositoryImpl()) {
        self.countryListRepository = countryListRepository
    }

    // MARK: - Function

    func fetchCountryList() {
        Task { @MainActor in
            self.requestStatus = .requesting
            do {
                // MEMO: async/awaitベースの処理で必要な値を取得し、その後`@Published`で定義した値を更新する
                self.countryListEntities = try await self.countryListRepository.getAllCountries()
                self.requestStatus = .success
            } catch let error {
                // MEMO: 本来ならばエラーハンドリング処理等を入れる必要がある
                print("Fetch Country List Error: " + error.localizedDescription)
                self.requestStatus = .failure
            }
        }
    }
}
