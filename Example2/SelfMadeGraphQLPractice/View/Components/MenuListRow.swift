//
//  MenuListRow.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct MenuListRow: View {

    // MARK: - Property

    private var titleFont: Font {
        return Font.custom("AvenirNext-Bold", size: 12)
    }

    private var titleColor: Color {
        return Color.primary
    }
    
    private var filterNameFont: Font {
        return Font.custom("AvenirNext-Bold", size: 12)
    }

    private var filterNameColor: Color {
        return Color.gray
    }

    private var subItemFont: Font {
        return Font.custom("AvenirNext-Regular", size: 12)
    }

    private var subItemColor: Color {
        return Color.gray
    }

    private let menuEntity: MenuEntity

    // MARK: - Initializer

    init(menuEntity: MenuEntity) {
        self.menuEntity = menuEntity
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            // メインの情報表示部分
            HStack(spacing: 0.0) {
                // 1. サムネイル画像表示
                WebImage(url: menuEntity.thumbnail)
                    .resizable()
                    .placeholder {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 96.0, height: 72.0)
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .transition(.fade(duration: 0.24))
                    .frame(width: 96.0, height: 72.0)
                    .cornerRadius(4.0)
                    .padding(.trailing, 12.0)
                // 2. 文言表示
                VStack(alignment: .leading, spacing: 0.0) {
                    // 2-(1). 日付
                    Text(menuEntity.name)
                        .font(titleFont)
                        .foregroundColor(titleColor)
                    // 2-(2). フィルター項目(カテゴリーや区分)
                    HStack(alignment: .top, spacing: 0.0) {
                        Text(menuEntity.dishType)
                            .font(filterNameFont)
                            .foregroundColor(filterNameColor)
                        Spacer()
                            .frame(width: 8.0)
                        Text(menuEntity.categorySlug)
                            .font(filterNameFont)
                            .foregroundColor(filterNameColor)
                    }
                    .padding(.top, 4.0)
                    // 2-(3). タイトル
                    HStack(alignment: .top, spacing: 0.0) {
                        Text("カロリー: \(menuEntity.kcal) [kcal]")
                            .font(subItemFont)
                            .foregroundColor(subItemColor)
                        Spacer()
                            .frame(width: 8.0)
                        Text("値段: \(menuEntity.price) [円]")
                            .font(subItemFont)
                            .foregroundColor(subItemColor)
                    }
                    .padding(.top, 4.0)
                }
            }
        }
    }
}

#Preview {
    MenuListRow(
        menuEntity: MenuEntity(
            id: "1",
            name: "アジフライ",
            dishType: "main_dish",
            categorySlug: "fish",
            price: 360,
            kcal: 340,
            thumbnail: "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000001.jpg"
        )
    )
}
