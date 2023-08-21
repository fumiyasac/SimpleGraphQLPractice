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
                ForEach(viewModel.countryListEntities, id: \.code) { countryListEntity in
                    NavigationLink(
                        destination: EmptyView(),
                        label: {
                            CountryListRow(countryListEntity: countryListEntity)
                        }
                    )
                }
            }
            .navigationBarTitle("Country List", displayMode: .large)
            .listStyle(.inset)
            .onFirstAppear {
                viewModel.fetchCountryList()
            }
        }
    }
}

// MARK: - Preview

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView(
            viewModel: CountryListViewModel(
                countryListRepository: CountryListRepositorySuccessMock()
            )
        )
    }
}
