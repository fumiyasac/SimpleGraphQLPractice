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
        VStack {
            List {
                ForEach(viewModel.countryListEntities, id: \.code) { entity in
                    Text(entity.name)
                }
            }
        }
        .onAppear (perform: viewModel.fetchCountryList)
    }
}

//struct CountryListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryListView()
//    }
//}
