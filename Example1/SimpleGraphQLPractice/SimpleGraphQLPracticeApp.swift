//
//  SimpleGraphQLPracticeApp.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/06/16.
//

import SwiftUI

// 概要:
// GraphQL(Apollo v1.5: 2023/09/27時点)からSchemaをダウンロードして適用する。
// https://countries.trevorblades.com/

@main
struct SimpleGraphQLPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            CountryListView()
        }
    }
}
