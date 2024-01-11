//
//  TokenizerPresenter.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 11.01.2024.
//

import Foundation

final class TokenizerPresenter {
    weak var viewInput: TokenizerViewInput?
}

// MARK: - TokenizerViewOutput

extension TokenizerPresenter: TokenizerViewOutput {
    func onTextDidChanged(text: String) {
        
    }
}
