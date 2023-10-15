//
//  CategorySlug.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/14.
//

import Foundation

enum CategorySlug: String, CaseIterable {
    case fish
    case meat
    case noodle
    case rice
    case vegetable
    case dessert
    case bread
    case seaweed
    case soup

    var name: String {
        switch self {
        case .fish:
            "魚料理"
        case .meat:
            "肉料理"
        case .noodle:
            "麺類"
        case .rice:
            "米"
        case .vegetable:
            "野菜料理"
        case .dessert:
            "デザート"
        case .bread:
            "パン"
        case .seaweed:
            "海藻"
        case .soup:
            "スープ"
        }
    }
}
