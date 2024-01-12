//
//  TokenizerService.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 12.01.2024.
//

import Foundation

extension String {
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }

    var hyphen: String {
        "- " + self
    }
}

struct TokenizerService {

}

// MARK: - Tokenizer

extension TokenizerService: Tokenizer {
    func tokenize(text: String) -> [String] {
        var buffer: String = ""
        var tokens: [String] = []

        text.enumerateSubstrings(in: text.startIndex..., options: .byCaretPositions) { substring, substringRange, enclosingRange, _ in

            guard let substring = substring else { return }

            buffer.append(substring)

            if buffer.hasSuffix("and") {
                buffer = String(
                    buffer
                        .dropLast(3)
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                )
                tokens.append(buffer)
                buffer = "and"
            }

            if buffer.hasSuffix("if") {
                buffer = String(
                    buffer
                        .dropLast(2)
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                )
                tokens.append(buffer)
                buffer = "if"
            }

            if substringRange.upperBound == text.endIndex {
                tokens.append(buffer)
            }
        }

        return tokens
    }
}
