//
//  SelectCategorySlugView.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/15.
//

import SwiftUI

struct SelectCategorySlugView: View {

    // MARK: - Typealias

    typealias TapCategorySlugChipAction = (String?) -> Void

    // MARK: - Property

    private var categorySlugSliderTitleFont: Font {
        return Font.custom("AvenirNext-Bold", size: 13)
    }

    private var categorySlugSliderTitleColor: Color {
        return Color.secondary
    }

    private var categorySlugBorderColor: Color {
        return Color(uiColor: UIColor(code: "#de9610"))
    }

    private var normalCategorySlugFont: Font {
        return Font.custom("AvenirNext-Regular", size: 13)
    }

    private var normalCategorySlugTintColor: Color {
        return Color(uiColor: UIColor(code: "#de9610"))
    }

    private var normalCategorySlugBackgroudColor: Color {
        return Color.white
    }
    
    private var selectedCategorySlugFont: Font {
        return Font.custom("AvenirNext-Bold", size: 13)
    }

    private var selectedCategorySlugTintColor: Color {
        return Color.white
    }

    private var selectedCategorySlugBackgroudColor: Color {
        return Color(uiColor: UIColor(code: "#de9610"))
    }

    private let selectedCategorySlug: String?
    private let tapCategorySlugChipAction: SelectCategorySlugView.TapCategorySlugChipAction

    // MARK: - Initializer

    init(
        selectedCategorySlug: String?,
        tapCategorySlugChipAction: @escaping SelectCategorySlugView.TapCategorySlugChipAction
    ) {
        self.selectedCategorySlug = selectedCategorySlug
        self.tapCategorySlugChipAction = tapCategorySlugChipAction
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                Text("カテゴリー検索:")
                    .font(categorySlugSliderTitleFont)
                    .foregroundColor(categorySlugSliderTitleColor)
                    .padding(.top, 12.0)
                Spacer()
            }
            // カテゴリー一覧表示に関連する部分
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8.0) {
                        ForEach(CategorySlug.allCases, id: \.self) { targetCategorySlug in
                            let selected = (selectedCategorySlug == targetCategorySlug.rawValue)
                            // Category表示用のChip型部分
                            VStack(alignment: .leading) {
                                Text(targetCategorySlug.name)
                                    .font(selected ? selectedCategorySlugFont : normalCategorySlugFont)
                                    .foregroundColor(selected ? selectedCategorySlugTintColor : normalCategorySlugTintColor)
                                    .padding(.horizontal, 12.0)
                                    .padding(.vertical, 6.0)
                            }
                            .background(selected ? selectedCategorySlugBackgroudColor : normalCategorySlugBackgroudColor)
                            // MEMO: 角丸にしたい場合には.cornerRadiusと.overlayを両方設定する必要がある
                            .cornerRadius(24.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24.0)
                                    .stroke(categorySlugBorderColor, lineWidth: 1.0)
                            )
                            .onTapGesture(perform: {
                                if selected {
                                    tapCategorySlugChipAction(nil)
                                } else {
                                    tapCategorySlugChipAction(targetCategorySlug.rawValue)
                                }
                            })
                        }
                    }
                }
            }
            .frame(height: 44.0)
        }
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    SelectCategorySlugView(
        selectedCategorySlug: "meat",
        tapCategorySlugChipAction: { _ in }
    )
}
