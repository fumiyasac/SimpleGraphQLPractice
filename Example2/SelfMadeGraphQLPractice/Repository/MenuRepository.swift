//
//  MenuRepository.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/08.
//

import Apollo
import Foundation

protocol MenuRepository {
    func getFilteredMenus(        
        dishType: String?,
        categorySlug: String?
    ) async throws -> [MenuEntity]
}

final class MenuRepositoryImpl: MenuRepository {

    // MARK: - Property

    private let menuRequest: MenuRequest

    // MARK: - Initializer

    init(menuRequest: MenuRequest = MenuRequestImpl()) {
        self.menuRequest = menuRequest
    }

    // MARK: - Function

    func getFilteredMenus(
        dishType: String?,
        categorySlug: String?
    ) async throws -> [MenuEntity] {
        let result = try await menuRequest.getResult(
            dishType: dishType,
            categorySlug: categorySlug
        )
        return convertToEntities(result: result)
    }

    // MARK: - Private Function

    private func convertToEntities(result: GraphQLResult<MenuExhibitionSchema.GetAllMenusQuery.Data>) -> [MenuEntity] {
        result.data?.getMenus?.compactMap {
            MenuEntity(
                id: $0.id,
                name: $0.name,
                dishType: $0.dishType,
                categorySlug: $0.categorySlug,
                price: $0.price,
                kcal: $0.kcal,
                thumbnail: $0.thumbnail
            )
        } ?? []
    }
}

