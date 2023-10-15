//
//  InqureScreenView.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/15.
//

import SwiftUI

struct InqureScreenView: View {

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
        return Color.orange
    }
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("タイトル:")) {
                    TextField("ssss", text: .constant("タイトルを入力"))
                        .listRowSeparator(.hidden)
                }

                Section(header: Text("種別:")) {
                    
                }

                Section(header: Text("本文:")) {
                    TextEditor(text: .constant("本文を入力\n本文を入力\n本文を入力\n本文を入力\n本文を入力"))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(5)
                        .frame(height: 200.0)
                        .listRowSeparator(.hidden)
                }

                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        // MEMO: 縁取りをした角丸ボタンのための装飾
                        Text("再読み込みを実行する")
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
                .listRowSeparator(.hidden)
            }
            .navigationBarTitle("お問い合わせ", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(
                    action: {
                        dismiss()
                    },
                    label: {
                        //
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                    }
                )
            )
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .onFirstAppear(onceExecuteAction: {})
        }
    }
}

#Preview {
    InqureScreenView()
}
