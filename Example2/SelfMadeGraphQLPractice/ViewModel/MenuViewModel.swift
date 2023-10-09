//
//  MenuViewModel.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/09.
//

import Foundation

final class MenuViewModel: ObservableObject {

    // MARK: - Property

    private let menuRepository: MenuRepository

    @Published private(set) var dishType: String? = nil
    @Published private(set) var categorySlug: String? = nil
    @Published private(set) var menuEntities: [MenuEntity] = []
    @Published private(set) var requestStatus: RequestStatus = .none

    // MARK: - Initializer

    init(menuRepository: MenuRepository = MenuRepositoryImpl()) {
        self.menuRepository = menuRepository
    }

    // MARK: - Function

    func fetchMenu(
        dishType: String?,
        categorySlug: String?
    ) {
        Task { @MainActor in
            self.requestStatus = .requesting
            do {
                // MEMO: async/awaitベースの処理で必要な値を取得し、その後`@Published`で定義した値を更新する
                self.menuEntities = try await self.menuRepository.getFilteredMenus(
                    dishType: dishType,
                    categorySlug: categorySlug
                )
                self.requestStatus = .success
            } catch let error {
                // MEMO: 本来ならばエラーハンドリング処理等を入れる必要がある
                print("Fetch Country List Error: " + error.localizedDescription)
                self.requestStatus = .failure
            }
        }
    }
}
