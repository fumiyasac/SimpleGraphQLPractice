//
//  RequestStatus.swift
//  SimpleGraphQLPractice
//
//  Created by 酒井文也 on 2023/08/25.
//

import Foundation

// MARK: - RequestStatus
// MEMO: ViewModelクラス内で利用するGraphQL側との疎通ステータスを指し示すEnum定義

enum RequestStatus {
    case requesting
    case success
    case failure
    case none
}
