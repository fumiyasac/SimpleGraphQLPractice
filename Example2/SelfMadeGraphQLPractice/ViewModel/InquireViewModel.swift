//
//  InquireViewModel.swift
//  SelfMadeGraphQLPractice
//
//  Created by 酒井文也 on 2023/10/15.
//

import Foundation

final class InquireViewModel: ObservableObject {

    // MARK: - Property

    private let inquireRepository: InquireRepository

    // MEMO: テキスト入力内容と表示を連動させるため、`private(set)`にはしていない点に注意
    @Published var inputTitle = ""
    @Published var inputText = ""

    @Published private(set) var requestStatus: RequestStatus = .none

    var shouldBeActiveSubmitButton: Bool {
        let existsBlankField = (inputTitle.count == 0 || inputText.count == 0)
        let shouldRequesting = requestStatus == .requesting
        return existsBlankField || shouldRequesting
    }

    // MARK: - Initializer

    init(inquireRepository: InquireRepository = InquireRepositoryImpl()) {
        self.inquireRepository = inquireRepository
    }

    // MARK: - Function

    func addInquire() {
        Task { @MainActor in
            self.requestStatus = .requesting
            do {
                let inquireEntity = try await self.inquireRepository.addInquire(title: inputTitle, text: inputText)
                print("Add Inquire Success! → Entity: ", inquireEntity as Any)
                self.requestStatus = .success
                self.resetFields()
            } catch let error {
                // MEMO: 本来ならばエラーハンドリング処理等を入れる必要がある
                print("Add Inquire Error: " + error.localizedDescription)
                self.requestStatus = .failure
            }
        }
    }

    // MARK: - Private Function

    private func resetFields() {
        inputTitle.removeAll()
        inputText.removeAll()
    }
}
