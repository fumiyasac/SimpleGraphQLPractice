//
//  NewsListRow.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/14.
//

import SwiftUI

struct NewsListRow: View {

    // MARK: - Property

    private var dateFont: Font {
        return Font.custom("AvenirNext-Bold", size: 12)
    }

    private var dateColor: Color {
        return Color.primary
    }

    private var titleFont: Font {
        return Font.custom("AvenirNext-Regular", size: 12)
    }

    private var titleColor: Color {
        return Color.gray
    }

    private let newsEntity: NewsEntity

    // MARK: - Initializer

    init(newsEntity: NewsEntity) {
        self.newsEntity = newsEntity
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            // メインの情報表示部分
            HStack(alignment: .top, spacing: 0.0) {
                // 1. サムネイル画像表示
                Image(getImageName(genre: newsEntity.genre))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0)
                    .cornerRadius(4.0)
                    .padding(.trailing, 12.0)
                // 2. 文言表示
                VStack(alignment: .leading, spacing: 0.0) {
                    // 2-(1). 日付
                    Text(newsEntity.date)
                        .font(dateFont)
                        .foregroundColor(dateColor)
                    // 2-(2). タイトル
                    Text(newsEntity.title)
                        .font(titleFont)
                        .foregroundColor(titleColor)
                        .lineSpacing(4.0)
                        .lineLimit(2)
                        .padding(.top, 8.0)
                }
            }
        }
    }

    // MARK: - Private Function

    private func getImageName(genre: String) -> String {
        "0000_news_\(genre)"
    }
}

#Preview {
    let newsEntity = NewsEntity(id: "1", title: "モバイルアプリがバージョンアップ(v3.0.0)をしました", date: "2023/09/28", genre: "mobile")
    return NewsListRow(newsEntity: newsEntity)
}
