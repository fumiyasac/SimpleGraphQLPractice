//
//  MockError.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/22.
//

import Foundation

struct MockError: Error {

    // MARK: - Class Function

    static func with(localizedDescription: String = "") -> Error {
        return NSError(domain: "net.just1factory.error", code: 0, userInfo: [NSLocalizedDescriptionKey : localizedDescription]) as Error
    }
}
