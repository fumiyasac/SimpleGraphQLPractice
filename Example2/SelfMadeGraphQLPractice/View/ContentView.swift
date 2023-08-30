//
//  ContentView.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/07/16.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Body

    var body: some View {
        TabView {
            ItemsScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "text.below.photo.fill")
                        Text("アイテム一覧")
                    }
                }
                .tag(0)
            AnnouncementsScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "bell.badge.fill")
                        Text("お知らせ")
                    }
                }.tag(1)
        }
        .accentColor(Color(uiColor: UIColor(code: "#de9610")))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
