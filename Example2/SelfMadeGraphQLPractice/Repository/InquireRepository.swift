//
//  InquireRepository.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/08.
//

import Apollo
import Foundation

protocol InquireRepository {
    func addInquire(
        title: String,
        text: String
    ) async throws -> InquireEntity?
}

final class InquireRepositoryImpl: InquireRepository {

    // MARK: - Property

    private let inquireRequest: InquireRequest

    // MARK: - Initializer

    init(inquireRequest: InquireRequest = InquireRequestImpl()) {
        self.inquireRequest = inquireRequest
    }

    // MARK: - Function

    func addInquire(
        title: String,
        text: String
    ) async throws -> InquireEntity? {
        let result = try await inquireRequest.addResult(
            title: title,
            text: text
        )
        return convertToEntities(result: result)
    }

    // MARK: - Private Function

    private func convertToEntities(result: GraphQLResult<MenuExhibitionSchema.AddInquireMutation.Data>) -> InquireEntity? {
        if let addInquire = result.data?.addInquire {
            return InquireEntity(
                id: addInquire.id,
                title: addInquire.title,
                text: addInquire.text
            )
        } else {
            return nil
        }
    }
}
