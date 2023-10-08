//
//  InquireEntity.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/08.
//

import Foundation

struct InquireEntity: Hashable {

    // MARK: - Property

    let id: String
    let title: String
    let purpose: String
    let text: String

    // MARK: - Initializer

    init(
        id: String,
        title: String,
        purpose: String,
        text: String
    ) {
        self.id = id
        self.title = title
        self.purpose = purpose
        self.text = text
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: InquireEntity, rhs: InquireEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.purpose == rhs.purpose
            && lhs.text == rhs.text
    }
}
