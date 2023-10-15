//
//  NewsScreenView.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/31.
//

import SwiftUI

struct NewsScreenView: View {

    // MARK: - Property

    @ObservedObject private var viewModel: NewsViewModel

    // MARK: - Initializer

    init(viewModel: NewsViewModel = NewsViewModel()) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List {
                switch viewModel.requestStatus {
                case .success:
                    // お知らせ一覧を取得して表示する
                    ForEach(viewModel.newsEntities, id: \.id) { newsEntity in
                        NewsListRow(newsEntity: newsEntity)
                    }
                case .failure:
                    // リクエストを再実行をするためのErrorView表示する
                    ConnectionErrorView(tapButtonAction: viewModel.fetchNews)
                default:
                    // 空のView要素を表示する
                    EmptyView()
                }
            }
            .navigationBarTitle("アプリからのお知らせ", displayMode: .inline)
            .listStyle(.inset)
            .onFirstAppear(onceExecuteAction: viewModel.fetchNews)
        }
    }
}
