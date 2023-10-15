//
//  SelectDishTypeView.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/15.
//

import SwiftUI

struct SelectDishTypeView: View {
    
    // MARK: - Typealias

    typealias TapDishTypeChipAction = (String?) -> Void

    // MARK: - Property

    private var dishTypeSliderTitleFont: Font {
        return Font.custom("AvenirNext-Bold", size: 13)
    }

    private var dishTypeSliderTitleColor: Color {
        return Color.secondary
    }

    private var dishTypeBorderColor: Color {
        return Color(uiColor: UIColor(code: "#de9610"))
    }

    private var normalDishTypeFont: Font {
        return Font.custom("AvenirNext-Regular", size: 13)
    }

    private var normalDishTypeTintColor: Color {
        return Color(uiColor: UIColor(code: "#de9610"))
    }

    private var normalDishTypeBackgroudColor: Color {
        return Color.white
    }
    
    private var selectedDishTypeFont: Font {
        return Font.custom("AvenirNext-Bold", size: 13)
    }

    private var selectedDishTypeTintColor: Color {
        return Color.white
    }

    private var selectedDishTypeBackgroudColor: Color {
        return Color(uiColor: UIColor(code: "#de9610"))
    }

    private let selectedDishType: String?
    private let tapDishTypeChipAction: SelectDishTypeView.TapDishTypeChipAction

    // MARK: - Initializer

    init(
        selectedDishType: String?,
        tapDishTypeChipAction: @escaping SelectDishTypeView.TapDishTypeChipAction
    ) {
        self.selectedDishType = selectedDishType
        self.tapDishTypeChipAction = tapDishTypeChipAction
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                Text("食事バランスガイド:")
                    .font(dishTypeSliderTitleFont)
                    .foregroundColor(dishTypeSliderTitleColor)
                    .padding(.top, 12.0)
                Spacer()
            }
            // 食事バランスガイド一覧表示に関連する部分
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8.0) {
                        ForEach(DishType.allCases, id: \.self) { targetDishType in
                            let selected = (selectedDishType == targetDishType.rawValue)
                            // 食事バランスガイド表示用のChip型部分
                            VStack(alignment: .leading) {
                                Text(targetDishType.name)
                                    .font(selected ? selectedDishTypeFont : normalDishTypeFont)
                                    .foregroundColor(selected ? selectedDishTypeTintColor : normalDishTypeTintColor)
                                    .padding(.horizontal, 12.0)
                                    .padding(.vertical, 6.0)
                            }
                            .background(selected ? selectedDishTypeBackgroudColor : normalDishTypeBackgroudColor)
                            // MEMO: 角丸にしたい場合には.cornerRadiusと.overlayを両方設定する必要がある
                            .cornerRadius(24.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24.0)
                                    .stroke(dishTypeBorderColor, lineWidth: 1.0)
                            )
                            .onTapGesture(perform: {
                                if selected {
                                    tapDishTypeChipAction(nil)
                                } else {
                                    tapDishTypeChipAction(targetDishType.rawValue)
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
    SelectDishTypeView(
        selectedDishType: "main_dish",
        tapDishTypeChipAction: { _ in }
    )
}
