//
//  MenuScreenView.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/31.
//

import SwiftUI

struct MenuScreenView: View {

    // MARK: - Property

    @ObservedObject private var viewModel: MenuViewModel

    // MARK: - Initializer

    init(viewModel: MenuViewModel = MenuViewModel()) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        NavigationStack {
            // カテゴリーでの絞り込み検索バー表示
            SelectCategorySlugView(
                selectedCategorySlug: viewModel.categorySlug ?? "",
                tapCategorySlugChipAction: { selectedCategorySlug in
                    viewModel.fetchMenu(dishType: viewModel.dishType, categorySlug: selectedCategorySlug)
                }
            )
            // 食事バランスガイドでの絞り込み検索バー表示
            SelectDishTypeView(
                selectedDishType: viewModel.dishType ?? "",
                tapDishTypeChipAction: { selectedDishType in
                    viewModel.fetchMenu(dishType: selectedDishType, categorySlug: viewModel.categorySlug)
                }
            )
            List {
                switch viewModel.requestStatus {
                case .success:
                    // お知らせ一覧を取得して表示する
                    ForEach(viewModel.menuEntities, id: \.id) { menuEntity in
                        MenuListRowView(menuEntity: menuEntity)
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
            .navigationBarItems(
                trailing: Button(
                    action: {}, 
                    label: {
                        //
                        NavigationLink(
                            destination: InqureScreenView(),
                            label: {
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(.white)
                            }
                        )
                    }
                )
            )
            .listStyle(.inset)
            .onFirstAppear(
                onceExecuteAction: {
                    viewModel.fetchMenu(dishType: viewModel.dishType, categorySlug: viewModel.categorySlug)
                }
            )
        }
    }
}
