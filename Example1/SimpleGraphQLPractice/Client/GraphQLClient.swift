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

    lazy private(set) var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
}
