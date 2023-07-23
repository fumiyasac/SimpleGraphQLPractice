//
//  SimpleGraphQLPracticeApp.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/06/16.
//

import SwiftUI

// GraphQL(Apollo v1.3)からSchemaをダウンロードして適用する。
// https://countries.trevorblades.com/

@main
struct SimpleGraphQLPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            CountryListView()
        }
    }
}
