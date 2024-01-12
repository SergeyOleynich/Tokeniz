//
//  TokenizerViewOutput.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 11.01.2024.
//

import Foundation

protocol TokenizerViewOutput {
    func onTextDidChanged(text: String)
    func onLanguageTapped()
}
