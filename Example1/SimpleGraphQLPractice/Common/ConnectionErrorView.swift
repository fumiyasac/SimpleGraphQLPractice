//
//  ConnectionErrorView.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/22.
//

import SwiftUI
import UIKit

struct ConnectionErrorView: View {

    // MARK: - Typealias

    typealias TapButtonAction = () -> Void

    // MARK: - Property

    private var connectionErrorTitleFont: Font {
        return Font.custom("AvenirNext-Bold", size: 18)
    }

    private var connectionErrorTitleColor: Color {
        return Color.primary
    }

    private var connectionErrorButtonFont: Font {
        return Font.custom("AvenirNext-Bold", size: 16)
    }

    private var connectionErrorButtonColor: Color {
        return Color.secondary
    }

    private var tapButtonAction: ConnectionErrorView.TapButtonAction

    // MARK: - Initializer

    init(tapButtonAction: @escaping ConnectionErrorView.TapButtonAction) {
        self.tapButtonAction = tapButtonAction
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0.0) {
            // 1. Spacer
            Spacer()
            // 2. コンテンツ表示部分
            VStack {
                // (1) エラータイトル表示
                Text("Error: Connection Failure")
                    .font(connectionErrorTitleFont)
                    .foregroundColor(connectionErrorTitleColor)
                // (2) リクエスト再実行ボタン表示
                HStack {
                    Spacer()
                    Button(action: tapButtonAction, label: {
                        // MEMO: 縁取りをした角丸ボタンのための装飾
                        Text("Retry Resquest")
                            .font(connectionErrorButtonFont)
                            .foregroundColor(connectionErrorButtonColor)
                            .background(.white)
                            .frame(width: 240.0, height: 48.0)
                            .cornerRadius(24.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24.0)
                                    .stroke(connectionErrorButtonColor, lineWidth: 1.0)
                            )
                    })
                    Spacer()
                }
                .padding([.top, .bottom], 24.0)
            }
            // 3. Spacer
            Spacer()
        }
        .padding([.leading, .trailing], 12.0)
    }
}

// MARK: - Preview

struct ConnectionErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionErrorView(tapButtonAction: {})
    }
}
