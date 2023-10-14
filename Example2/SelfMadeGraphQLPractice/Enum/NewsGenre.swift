//
//  NewsGenre.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/14.
//

import Foundation

enum NewsGenre: String {
    case mobile
    case announce
    case cafetelia
    case bento
    case newcomer

    var imageAssetName: String {
        "0000_news_\(rawValue)"
    }
}
