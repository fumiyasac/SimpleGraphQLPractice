//
//  CountryListEntity.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/06.
//

import Foundation

struct CountryListEntity: Hashable {

    // MARK: - Property

    let code: String
    let name: String
    let emoji: String

    // MARK: - Initializer

    init(code: String, name: String, emoji: String) {
        self.code = code
        self.name = name
        self.emoji = emoji
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }

    static func == (lhs: CountryListEntity, rhs: CountryListEntity) -> Bool {
        return lhs.code == rhs.code && lhs.name == rhs.name && lhs.emoji == rhs.emoji
    }
}
