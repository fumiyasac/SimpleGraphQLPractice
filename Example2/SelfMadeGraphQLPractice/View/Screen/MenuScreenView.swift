//
//  MenuScreenView.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/31.
//

import SwiftUI

struct MenuScreenView: View {

    // MARK: - Property

    @ObservedObject private var viewModel: MenuViewModel = MenuViewModel()

    // MARK: - Initializer

    init(viewModel: MenuViewModel = MenuViewModel()) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List {
                switch viewModel.requestStatus {
                case .success:
                    // お知らせ一覧を取得して表示する
                    ForEach(viewModel.menuEntities, id: \.id) { menuEntity in
                        MenuListRow(menuEntity: menuEntity)
                    }
                case .failure:
                    // リクエストを再実行をするためのErrorView表示する
                    ConnectionErrorView(
                        tapButtonAction: {
                            viewModel.fetchMenu(dishType: viewModel.dishType, categorySlug: viewModel.categorySlug)
                        }
                    )
                default:
                    // 空のView要素を表示する
                    EmptyView()
                }
            }
            .navigationBarTitle("メニュー一覧表示", displayMode: .inline)
            .listStyle(.inset)
            .onFirstAppear(
                onceExecuteAction: {
                    viewModel.fetchMenu(dishType: viewModel.dishType, categorySlug: viewModel.categorySlug)
                }
            )
        }
    }
}

// MARK: - Preview

#Preview {
    MenuScreenView()
}
