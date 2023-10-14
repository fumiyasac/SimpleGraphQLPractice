//
//  DishType.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/14.
//

import Foundation

enum DishType: String {
    case mainDish = "main_dish"
    case subDish = "sub_dish"
    case stapleFood = "staple_food"
    case soup
    case sweets

    var name: String {
        switch self {
        case .mainDish:
            "主菜"
        case .subDish:
            "副菜"
        case .stapleFood:
            "主食"
        case .soup:
            "汁物"
        case .sweets:
            "甘味"
        }
    }
}
