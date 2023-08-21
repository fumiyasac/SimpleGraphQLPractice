//
//  CountryListSeeder.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/22.
//

import Foundation

struct CountryListSeeder {

    // MARK: - Property

    static let `default` = [
        CountryListEntity(code: "MY", name: "Malaysia", emoji: "🇲🇾"),
        CountryListEntity(code: "TH", name: "Thailand", emoji: "🇹🇭"),
        CountryListEntity(code: "MX", name: "Mexico", emoji: "🇲🇽"),
        CountryListEntity(code: "JP", name: "Japan", emoji: "🇯🇵"),
        CountryListEntity(code: "IN", name: "India", emoji: "🇮🇳")
    ]
}
