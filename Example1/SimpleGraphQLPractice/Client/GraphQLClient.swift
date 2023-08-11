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
        // MEMO: Client作成部分に関する詳細な設定については公式ドキュメントを参考にすると良さそうです。
        // ドキュメント: https://www.apollographql.com/docs/ios/networking/client-creation
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = DefaultInterceptorProvider(
            client: URLSessionClient(),
            store: store
        )
        // MEMO: エンドポイントはすでにサンプルとして公開されているものを利用する形としています。
        // 動作コード: https://github.com/trevorblades/countries
        let url = URL(string: "https://countries.trevorblades.com/")!
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url,
            // MEMO: もしHeader用のAccessTokenを付与する場合はこちらを活用することになります。
            additionalHeaders: ["Authorization": "Bearer "]
        )
        return ApolloClient(networkTransport: transport, store: store)
    }()
}
