//
//  MenuRequest.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/08.
//

import Apollo
import Foundation

protocol MenuRequest {
    func getResult(
        dishType: String?,
        categorySlug: String?
    ) async throws -> GraphQLResult<MenuExhibitionSchema.GetAllMenusQuery.Data>
}

final class MenuRequestImpl: MenuRequest {

    // MARK: - Property

    private let apolloClient: ApolloClient

    // MARK: - Initializer

    init(apolloClient: ApolloClient = GraphQLClient.shared.apollo) {
        self.apolloClient = apolloClient
    }

    // MARK: - Function
    
    func getResult(
        dishType: String?,
        categorySlug: String?
    ) async throws -> GraphQLResult<MenuExhibitionSchema.GetAllMenusQuery.Data> {
        let query = MenuExhibitionSchema.GetAllMenusQuery(
            dishType: dishType ?? .null,
            categorySlug: categorySlug ?? .null
        )
        return try await apolloClient.fetchAsync(query: query)
    }
}
