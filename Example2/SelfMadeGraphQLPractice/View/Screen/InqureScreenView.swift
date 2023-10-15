//
//  InqureScreenView.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/15.
//

import SwiftUI

struct InqureScreenView: View {
    
    // MARK: - Property
    
    private var inputTextFont: Font {
        return Font.custom("AvenirNext-Regular", size: 13)
    }
    
    private var resultTextFont: Font {
        return Font.custom("AvenirNext-Regular", size: 13)
    }
    
    private var resultTextColor: Color {
        return Color.red
    }
    
    private var submitButtonFont: Font {
        return Font.custom("AvenirNext-Bold", size: 16)
    }
    
    private var submitButtonColor: Color {
        return Color.orange
    }
    
    // 遷移先から遷移元へ戻るために必要なPropertyWrapper
    @Environment(\.dismiss) private var popToPrevious
    
    // テキスト入力エリア等のフォーカス制御用のPropertyWrapper
    @FocusState private var isKeyboardActive: Bool
    
    @ObservedObject private var viewModel: InquireViewModel
    
    // MARK: - Initializer
    
    init(viewModel: InquireViewModel = InquireViewModel()) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List {
                // 1. タイトル入力用Section
                Section(header: Text("タイトル:")) {
                    // MEMO: viewModelに準備した`@Published var inputTitle`と双方向のBindingを実施する
                    TextField("", text: $viewModel.inputTitle)
                        .font(inputTextFont)
                        .listRowSeparator(.hidden)
                        // フォーカス状態と連動させるためのModifier定義
                        .focused($isKeyboardActive)
                }
                // 2. 本文入力用Section
                Section(header: Text("本文:")) {
                    // MEMO: viewModelに準備した`@Published var inputTitle`と双方向のBindingを実施する
                    TextEditor(text: $viewModel.inputText)
                        .font(inputTextFont)
                        .listRowSeparator(.hidden)
                        // フォーカス状態と連動させるためのModifier定義
                        .focused($isKeyboardActive)
                }
                // 3. 送信メッセージ処理結果表示
                displayResultSectionIfNeeded()
                // 4. 送信ボタン表示
                HStack {
                    Spacer()
                    // MEMO: 送信ボタン部分のAction定義とViewModelでの処理を連動する
                    Button(
                        action: {
                            viewModel.addInquire()
                        },
                        label: {
                            Text("送信する")
                                .font(submitButtonFont)
                                .foregroundColor(submitButtonColor)
                                .background(.white)
                                .frame(width: 240.0, height: 48.0)
                                .cornerRadius(24.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24.0)
                                        .stroke(submitButtonColor, lineWidth: 1.0)
                                )
                        }
                    )
                    // MEMO: ボタン押下可否状態をViewModel側の状態に合わせて切り替える
                    .disabled(viewModel.shouldBeActiveSubmitButton)
                    Spacer()
                }
                .listRowSeparator(.hidden)
            }
            .toolbar {
                // キーボード入力時に表示するToolBarに関する定義
                // ※ TextEditorは「return」ボタン押下時にキーボードが閉じないので注意
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(
                        action: {
                            // キーボードのフォーカスを取り消す（UIKitのResignFirstResponderに相当するもの）
                            isKeyboardActive = false
                        },
                        label: {
                            Text("閉じる")
                        }
                    )
                }
            }
            .navigationBarTitle("お問い合わせ", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(
                    action: {
                        // 前に表示している画面へ戻る処理をこのタイミングで実行する
                        popToPrevious()
                    },
                    label: {
                        // MEMO: 戻るボタンを自前で作成する
                        // ※iOS15までサポートしていたり、UIKitとの混合であればUINavigationControllerの方がいいかも...
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                    }
                )
            )
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
        }
    }
    
    // MARK: - Private Function
    
    @ViewBuilder
    private func displayResultSectionIfNeeded() -> some View {
        let resultStatus = displayResultStatus()
        if resultStatus.shouldDisplayResultSection {
            HStack {
                Spacer()
                Text(resultStatus.message)
                    .font(resultTextFont)
                    .foregroundColor(resultTextColor)
                Spacer()
            }
            .listRowSeparator(.hidden)
        } else {
            EmptyView()
        }
    }

    private func displayResultStatus() -> (message: String, shouldDisplayResultSection: Bool) {
        if viewModel.requestStatus == .success {
            (message: "お問い合わせの送信に成功しました😋", shouldDisplayResultSection: true)
        } else if viewModel.requestStatus == .failure {
            (message: "お問い合わせの送信に失敗しました😢", shouldDisplayResultSection: true)
        } else {
            (message: "", shouldDisplayResultSection: false)
        }
    }
}
