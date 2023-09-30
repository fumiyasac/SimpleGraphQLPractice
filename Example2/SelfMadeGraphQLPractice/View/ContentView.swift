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
            MenuScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "fork.knife.circle.fill")
                        Text("メニュー")
                    }
                }
                .tag(0)
            NewsScreenView()
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

// MARK: - Preview

#Preview {
    ContentView()
}
