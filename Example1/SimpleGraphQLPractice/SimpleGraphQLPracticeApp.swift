//
//  SimpleGraphQLPracticeApp.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/06/16.
//

import SwiftUI

// 概要:
// GraphQL(Apollo v1.4)からSchemaをダウンロードして適用する。
// https://countries.trevorblades.com/

@main
struct SimpleGraphQLPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            CountryListView()
        }
    }
}
