//
//  TokenizerPresenter.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 11.01.2024.
//

import Foundation

final class TokenizerPresenter {
    weak var viewInput: TokenizerViewInput?

    private let tokenizer: Tokenizer
    private let displayItemProvider: TokenDisplayItemProvider

    init(tokenizer: Tokenizer, displayItemProvider: TokenDisplayItemProvider) {
        self.tokenizer = tokenizer
        self.displayItemProvider = displayItemProvider
    }
}

// MARK: - TokenizerViewOutput

extension TokenizerPresenter: TokenizerViewOutput {
    func onTextDidChanged(text: String) {
        let tokens = tokenizer.tokenize(text: text)
        let displayModel = displayItemProvider.provideDisplayItem(for: tokens)

        viewInput?.didProcessItem(item: displayModel)
    }
}
