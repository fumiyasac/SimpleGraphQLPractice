//
//  NewsRepository.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/08.
//

import Apollo
import Foundation

protocol NewsRepository {
    func getAllNews() async throws -> [NewsEntity]
}

final class NewsRepositoryImpl: NewsRepository {

    // MARK: - Property

    private let newsRequest: NewsRequest

    // MARK: - Initializer

    init(newsRequest: NewsRequest = NewsRequestImpl()) {
        self.newsRequest = newsRequest
    }

    // MARK: - Function

    func getAllNews() async throws -> [NewsEntity] {
        let result = try await newsRequest.getResult()
        return convertToEntities(result: result)
    }

    // MARK: - Private Function

    private func convertToEntities(result: GraphQLResult<MenuExhibitionSchema.GetAllNewsQuery.Data>) -> [NewsEntity] {
        result.data?.getNews?.compactMap {
            NewsEntity(
                id: $0.id,
                title: $0.title,
                date: $0.date,
                genre: $0.genre
            )
        } ?? []
    }
}
