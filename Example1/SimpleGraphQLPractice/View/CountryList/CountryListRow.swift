//
//  CountryListRow.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/06/16.
//

import SwiftUI

struct CountryListRow: View {

    // MARK: - Property

    private var emojiAndCodeFont: Font {
        return Font.custom("AvenirNext-Bold", size: 14)
    }

    private var emojiAndCodeColor: Color {
        return Color.primary
    }

    private var nameFont: Font {
        return Font.custom("AvenirNext-Regular", size: 14)
    }

    private var nameColor: Color {
        return Color.gray
    }

    private let countryListEntity: CountryListEntity

    // MARK: - Initializer

    init(countryListEntity: CountryListEntity) {
        self.countryListEntity = countryListEntity
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            // 1-(1). 絵文字とコード
            Text(countryListEntity.emoji + " : " + countryListEntity.code)
                .font(emojiAndCodeFont)
                .foregroundColor(emojiAndCodeColor)
            // 1-(2). 国名
            Text(countryListEntity.name)
                .font(nameFont)
                .foregroundColor(nameColor)
                .padding(.top, 8.0)
        }
    }
}

// MARK: - Preview

struct CountryListRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryListRow(
            countryListEntity: CountryListSeeder.default.first!
        )
    }
}
