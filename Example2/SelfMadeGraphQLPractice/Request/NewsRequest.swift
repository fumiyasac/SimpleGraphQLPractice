//
//  NewsRequest.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/08.
//

import Apollo
import Foundation

protocol NewsRequest {
    func getResult() async throws -> GraphQLResult<MenuExhibitionSchema.GetAllNewsQuery.Data>
}

final class NewsRequestImpl: NewsRequest {

    // MARK: - Property

    private let apolloClient: ApolloClient

    // MARK: - Initializer

    init(apolloClient: ApolloClient = GraphQLClient.shared.apollo) {
        self.apolloClient = apolloClient
    }

    // MARK: - Function

    func getResult() async throws -> GraphQLResult<MenuExhibitionSchema.GetAllNewsQuery.Data> {
        let query = MenuExhibitionSchema.GetAllNewsQuery()
        return try await apolloClient.fetchAsync(query: query)
    }
}
