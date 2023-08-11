//
//  ApolloClientExtension.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/09.
//

import Apollo
import Foundation

// 実装の参考:
// 「apollo-ios」内のIssue内のディスカッションで紹介されていたコードを参考にしています。
// Apollo内で用意されているQuery & Mutationの実行処理をasync/awaitでラッピングしている。
// https://github.com/apollographql/apollo-ios/issues/2216

// MARK: - ApolloClient Extension

extension ApolloClient {

    // GraphQLのQueryをする処理をasync/awaitの処理内で実行する
    @discardableResult
    func fetchAsync<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        contextIdentifier: UUID? = nil,
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Query.Data> {

        // MEMO: withCheckedThrowingContinuationでErrorをthrowする形にしています。
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

    // GraphQLのMutationをする処理をasync/awaitの処理内で実行する
    @discardableResult
    func performAsync<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool = true,
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Mutation.Data> {

        // MEMO: withCheckedThrowingContinuationでErrorをthrowする形にしています。
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
