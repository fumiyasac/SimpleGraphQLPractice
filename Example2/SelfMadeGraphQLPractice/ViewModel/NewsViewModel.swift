//
//  NewsViewModel.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/09.
//

import Foundation

final class NewsViewModel: ObservableObject {
    
    // MARK: - Property
    
    private let newsRepository: NewsRepository

    @Published private(set) var newsEntities: [NewsEntity] = []
    @Published private(set) var requestStatus: RequestStatus = .none

    // MARK: - Initializer

    init(newsRepository: NewsRepository = NewsRepositoryImpl()) {
        self.newsRepository = newsRepository
    }

    // MARK: - Function

    func fetchNews() {
        Task { @MainActor in
            self.requestStatus = .requesting
            do {
                // MEMO: async/awaitベースの処理で必要な値を取得し、その後`@Published`で定義した値を更新する
                self.newsEntities = try await self.newsRepository.getAllNews()
                self.requestStatus = .success
            } catch let error {
                // MEMO: 本来ならばエラーハンドリング処理等を入れる必要がある
                print("Fetch Country List Error: " + error.localizedDescription)
                self.requestStatus = .failure
            }
        }
    }
}

