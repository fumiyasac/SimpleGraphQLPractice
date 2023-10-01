//
//  CountryDetailFirstView.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/27.
//

import SwiftUI

struct CountryDetailFirstView: View {

    // MARK: - Property

    private var emojiFont: Font {
        return Font.custom("AvenirNext-Bold", size: 96)
    }

    private var codeFont: Font {
        return Font.custom("AvenirNext-Bold", size: 36)
    }

    private var codeColor: Color {
        return Color.primary
    }

    private var nameFont: Font {
        return Font.custom("AvenirNext-Regular", size: 24)
    }

    private var nameColor: Color {
        return Color.gray
    }

    private let countryDetailEntity: CountryDetailEntity

    // MARK: - Initializer

    init(countryDetailEntity: CountryDetailEntity) {
        self.countryDetailEntity = countryDetailEntity
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            // 1-(1). 絵文字
            Text(countryDetailEntity.emoji)
                .font(emojiFont)
            // 1-(2). コード
            Text(countryDetailEntity.code)
                .font(codeFont)
                .foregroundColor(codeColor)
                .padding(.top, 8.0)
            // 1-(3). 国名
            Text(countryDetailEntity.name)
                .font(nameFont)
                .foregroundColor(nameColor)
                .padding(.top, 8.0)
        }
    }
}

// MARK: - Preview

#Preview {
    CountryDetailFirstView(
        countryDetailEntity: CountryDetailSeeder.default
    )
}
