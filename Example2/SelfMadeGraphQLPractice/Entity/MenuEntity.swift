//
//  MenuEntity.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/08.
//

import Foundation

struct MenuEntity: Hashable {

    // MARK: - Property
    
    let id: String
    let name: String
    let dishType: String
    let categorySlug: String
    let price: Int
    let kcal: Int
    let thumbnail: URL?

    // MARK: - Initializer

    init(
        id: String,
        name: String,
        dishType: String,
        categorySlug: String,
        price: Int,
        kcal: Int,
        thumbnail: String
    ) {
        self.id = id
        self.name = name
        self.dishType = dishType
        self.categorySlug = categorySlug
        self.price = price
        self.kcal = kcal
        self.thumbnail = URL(string: thumbnail)
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: MenuEntity, rhs: MenuEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.dishType == rhs.dishType
            && lhs.categorySlug == rhs.categorySlug
            && lhs.price == rhs.price
            && lhs.kcal == rhs.kcal
            && lhs.thumbnail == rhs.thumbnail
    }
}
