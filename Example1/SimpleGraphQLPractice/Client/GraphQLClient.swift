//
//  GraphQLClient.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/07/27.
//

import Foundation
import Apollo

final class GraphQLClient {

    // MARK: - Singleton Instance

    static let shared = GraphQLClient()

    private init() {}

    // MARK: - Property

    let apollo = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = DefaultInterceptorProvider(
            client: URLSessionClient(),
            store: store
        )
        let url = URL(string: "https://countries.trevorblades.com/")!
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url,
            additionalHeaders: ["Authorization": "Bearer "]
        )
        return ApolloClient(networkTransport: transport, store: store)
    }()
}
