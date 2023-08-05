//
//  CountryDetailEntity.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/06.
//

import Foundation

struct CountryDetailEntity: Hashable {

    // MARK: - Property

    let code: String
    let name: String
    let emoji: String
    let phone: String
    let native: String
    let awsRegion: String
    let continent: CountryDetailContinentEntity
    let languages: [CountryDetailLanguageEntity]
    let currencies: String
    let subdivisions: [CountryDetailSubdivisionEntity]

    // MARK: - Initializer

    init(
        code: String,
        name: String,
        emoji: String,
        phone: String,
        native: String,
        awsRegion: String,
        continent: CountryDetailContinentEntity,
        languages: [CountryDetailLanguageEntity],
        currencies: String,
        subdivisions: [CountryDetailSubdivisionEntity]
    ) {
        self.code = code
        self.name = name
        self.emoji = emoji
        self.phone = phone
        self.native = native
        self.awsRegion = awsRegion
        self.continent = continent
        self.languages = languages
        self.currencies = currencies
        self.subdivisions = subdivisions
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }

    static func == (lhs: CountryDetailEntity, rhs: CountryDetailEntity) -> Bool {
        return lhs.code == rhs.code
            && lhs.name == rhs.name
            && lhs.emoji == rhs.emoji
            && lhs.phone == rhs.phone
            && lhs.native == rhs.native
            && lhs.awsRegion == rhs.awsRegion
            && lhs.continent == rhs.continent
            && lhs.languages == rhs.languages
            && lhs.currencies == rhs.currencies
            && lhs.subdivisions == rhs.subdivisions
    }
}

struct CountryDetailContinentEntity: Hashable {

    // MARK: - Property

    let code: String
    let name: String

    // MARK: - Initializer

    init(
        code: String,
        name: String
    ) {
        self.code = code
        self.name = name
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }

    static func == (lhs: CountryDetailContinentEntity, rhs: CountryDetailContinentEntity) -> Bool {
        return lhs.code == rhs.code
            && lhs.name == rhs.name
    }
}

struct CountryDetailLanguageEntity: Hashable {

    // MARK: - Property

    let code: String
    let name: String

    // MARK: - Initializer

    init(
        code: String,
        name: String
    ) {
        self.code = code
        self.name = name
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }

    static func == (lhs: CountryDetailLanguageEntity, rhs: CountryDetailLanguageEntity) -> Bool {
        return lhs.code == rhs.code
            && lhs.name == rhs.name
    }
}

struct CountryDetailSubdivisionEntity: Hashable {

    // MARK: - Property

    let code: String
    let name: String

    // MARK: - Initializer

    init(
        code: String,
        name: String
    ) {
        self.code = code
        self.name = name
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }

    static func == (lhs: CountryDetailSubdivisionEntity, rhs: CountryDetailSubdivisionEntity) -> Bool {
        return lhs.code == rhs.code
            && lhs.name == rhs.name
    }
}
