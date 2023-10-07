//
//  NewsEntity.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/08.
//

import Foundation

struct NewsEntity: Hashable {

    // MARK: - Property

    let id: String
    let title: String
    let date: String
    let genre: String

    // MARK: - Initializer

    init(
        id: String,
        title: String,
        date: String,
        genre: String
    ) {
        self.id = id
        self.title = title
        self.date = date
        self.genre = genre
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: NewsEntity, rhs: NewsEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.date == rhs.date
            && lhs.genre == rhs.genre
    }
}
