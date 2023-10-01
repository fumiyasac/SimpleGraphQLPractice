//
//  CountryDetailSecondView.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/27.
//

import SwiftUI

struct CountryDetailSecondView: View {

    // MARK: - Property

    private var commonFont: Font {
        return Font.custom("AvenirNext-Regular", size: 14)
    }

    private var commonColor: Color {
        return Color.gray
    }

    private let countryDetailEntity: CountryDetailEntity

    // MARK: - Initializer

    init(countryDetailEntity: CountryDetailEntity) {
        self.countryDetailEntity = countryDetailEntity
    }

    // MARK: - Body

    var body: some View {
        let continent = countryDetailEntity.continent.name + "(" + countryDetailEntity.continent.code + ")"
        let languages = countryDetailEntity.languages.map { $0.name }.joined(separator: ",")

        VStack(alignment: .leading, spacing: 0.0) {
            // 1-(1). 電話番号
            Text("Phone:" + "\n" + countryDetailEntity.phone)
                .font(commonFont)
                .foregroundColor(commonColor)
                .padding(.top, 8.0)
            // 1-(2). 母国語
            Text("母国語:" + "\n" + countryDetailEntity.native)
                .font(commonFont)
                .foregroundColor(commonColor)
                .padding(.top, 8.0)
            // 1-(3). AWSのリージョン
            Text("AWSリージョン:" + "\n" + countryDetailEntity.awsRegion)
                .font(commonFont)
                .foregroundColor(commonColor)
                .padding(.top, 8.0)
            // 1-(4). 大陸
            Text("大陸:" + "\n" + continent)
                .font(commonFont)
                .foregroundColor(commonColor)
                .padding(.top, 8.0)
            // 1-(5). 通貨単位
            Text("通貨単位:" + "\n" + countryDetailEntity.currencies)
                .font(commonFont)
                .foregroundColor(commonColor)
                .padding(.top, 8.0)
            // 1-(6). 利用言語(複数)
            Text("利用言語(複数):" + "\n" + languages)
                .font(commonFont)
                .foregroundColor(commonColor)
                .padding(.top, 8.0)
        }
    }
}

// MARK: - Preview

#Preview {
    CountryDetailSecondView(
        countryDetailEntity: CountryDetailSeeder.default
    )
}
