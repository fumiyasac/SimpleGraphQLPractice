//
//  CountryDetailView.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/06/16.
//

import SwiftUI

struct CountryDetailView: View {

    // MARK: - Property

    private let code: String

    @ObservedObject private var viewModel: CountryDetailViewModel

    // MARK: - Initializer

    init(
        code: String,
        viewModel: CountryDetailViewModel = CountryDetailViewModel()
    ) {
        self.code = code
        self.viewModel = viewModel
    }

    // MARK: - body

    var body: some View {
        List {
            switch viewModel.requestStatus {
            case .success:
                // 国の詳細を取得して表示する
                if let countryDetailEntity = viewModel.countryDetailEntity {
                    CountryDetailFirstView(countryDetailEntity: countryDetailEntity)
                        .listRowSeparator(.hidden)
                    CountryDetailSecondView(countryDetailEntity: countryDetailEntity)
                        .listRowSeparator(.hidden)
                } else {
                    ConnectionErrorView(
                        tapButtonAction: {
                            viewModel.fetchCountry(code: code)
                        }
                    )
                }
            case .failure:
                // リクエストを再実行をするためのErrorView表示する
                ConnectionErrorView(
                    tapButtonAction: {
                        viewModel.fetchCountry(code: code)
                    }
                )
            default:
                // 空のView要素を表示する
                EmptyView()
            }
        }
        .navigationBarTitle("Country Detail")
        .listStyle(.inset)
        .onFirstAppear(
            onceExecuteAction: {
                viewModel.fetchCountry(code: code)
            }
        )
    }
}

// MARK: - Preview

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(code: "JP")
    }
}
