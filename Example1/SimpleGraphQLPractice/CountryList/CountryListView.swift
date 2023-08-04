//
//  CountryListView.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/06/16.
//

import SwiftUI

struct CountryListView: View {
    var body: some View {
        HStack {
            Text("国名とコードを表示したい")
        }
        .onAppear {
            let apollo = GraphQLClient.shared.apollo
            let query = CountriesSchema.GetAllCountriesQuery()
            apollo.fetch(query: query) { result in
                guard let data = try? result.get().data else { return }
                let _ = data.countries.compactMap { country in
                    print("-----------")
                    print("code:", country.code)
                    print("name:", country.name)
                    print("emoji:", country.emoji)
                    print("-----------")
                }
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
