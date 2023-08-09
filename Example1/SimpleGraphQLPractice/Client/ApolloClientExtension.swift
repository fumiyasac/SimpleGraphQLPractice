//
//  ApolloClientExtension.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/09.
//

import Apollo
import Foundation

// 参考にした「apollo-ios」内のIssueで紹介されていた実装例
// https://github.com/apollographql/apollo-ios/issues/2216

// MARK: - ApolloClient Extension

extension ApolloClient {

    //
    @discardableResult
    func fetchAsync<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        contextIdentifier: UUID? = nil,
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Query.Data> {

        //
        return try await withCheckedThrowingContinuation { continuation in
            fetch(
                query: query,
                cachePolicy: cachePolicy,
                contextIdentifier: contextIdentifier,
                queue: queue
            ) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    //
    @discardableResult
    func performAsync<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool = true,
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Mutation.Data> {

        //
        return try await withCheckedThrowingContinuation { continuation in
            perform(
                mutation: mutation,
                publishResultToStore: publishResultToStore,
                queue: queue
            ) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
