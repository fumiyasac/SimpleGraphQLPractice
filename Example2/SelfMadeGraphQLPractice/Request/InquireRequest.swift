//
//  InquireRequest.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/08.
//

import Apollo
import Foundation

protocol InquireRequest {
    func addResult(
        title: String,
        purpose: String,
        text: String
    ) async throws -> GraphQLResult<MenuExhibitionSchema.AddInquireMutation.Data>
}

final class InquireRequestImpl: InquireRequest {

    // MARK: - Property

    private let apolloClient: ApolloClient

    // MARK: - Initializer

    init(apolloClient: ApolloClient = GraphQLClient.shared.apollo) {
        self.apolloClient = apolloClient
    }

    // MARK: - Function

    func addResult(
        title: String,
        purpose: String,
        text: String
    ) async throws -> GraphQLResult<MenuExhibitionSchema.AddInquireMutation.Data> {
        let mutation = MenuExhibitionSchema.AddInquireMutation(
            title: title,
            purpose: purpose,
            text: text
        )
        return try await apolloClient.performAsync(mutation: mutation)
    }
}

