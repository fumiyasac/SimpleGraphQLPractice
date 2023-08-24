//
//  CountryDetailSeeder.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/24.
//

import Foundation

struct CountryDetailSeeder {

    // MARK: - Property

    static let `default` = CountryDetailEntity(
        code: "JP",
        name: "Japan",
        emoji: "🇯🇵",
        phone: "81",
        native: "日本",
        awsRegion: "ap-northeast-1",
        continent: CountryDetailContinentEntity(code: "AS", name: "Asia"),
        languages: [CountryDetailLanguageEntity(code: "ja", name: "Japanese")],
        currencies: "JPY"
    )
}
