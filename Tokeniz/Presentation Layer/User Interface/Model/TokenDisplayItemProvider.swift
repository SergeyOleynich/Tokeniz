//
//  TokenDisplayItemProvider.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 12.01.2024.
//

import Foundation

protocol TokenDisplayItemProvider {
    func provideDisplayItem(for tokens: [String]) -> TokenDisplayModel
}

struct TokenDisplayItemProviderImpl: TokenDisplayItemProvider {
    func provideDisplayItem(for tokens: [String]) -> TokenDisplayModel {
        return .init(
            tokens: tokens,
            displayString: tokens
                .map { $0.firstCapitalized }
                .map { $0.hyphen }
                .joined(separator: "\n"))
    }
}
