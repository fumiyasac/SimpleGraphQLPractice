//
//  CountryListView.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/06/16.
//

import SwiftUI

struct CountryListView: View {

    // MARK: - Property

    @ObservedObject private var viewModel: CountryListViewModel

    // MARK: - Initializer

    init(viewModel: CountryListViewModel = CountryListViewModel()) {
        self.viewModel = viewModel
    }

    // MARK: - body

    var body: some View {
        NavigationStack {
            List {
                switch viewModel.requestStatus {
                case .success:
                    // 国の一覧を取得して表示する
                    ForEach(viewModel.countryListEntities, id: \.code) { countryListEntity in
                        // セルをタップすると詳細画面へ遷移する
                        NavigationLink(
                            destination: CountryDetailView(code: countryListEntity.code),
                            label: {
                                CountryListRow(countryListEntity: countryListEntity)
                            }
                        )
                    }
                case .failure:
                    // リクエストを再実行をするためのErrorView表示する
                    ConnectionErrorView(tapButtonAction: viewModel.fetchCountryList)
                default:
                    // 空のView要素を表示する
                    EmptyView()
                }
            }
            .navigationBarTitle("Country List", displayMode: .large)
            .listStyle(.inset)
            .onFirstAppear(onceExecuteAction: viewModel.fetchCountryList)
        }
    }
}

// MARK: - Preview

#Preview {
    CountryListView(
        viewModel: CountryListViewModel(
            countryListRepository: CountryListRepositorySuccessMock()
        )
    )
}
