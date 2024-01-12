//
//  TokenizerService.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 12.01.2024.
//

import Foundation

final class TokenizerService {
    var language: Language = .english
}

// MARK: - Tokenizer

extension TokenizerService: Tokenizer {
    func tokenize(text: String) -> [String] {
        var buffer: String = ""
        var tokens: [String] = []

        text.enumerateSubstrings(
            in: text.startIndex...,
            options: .byCaretPositions
        ) { [weak self] substring, substringRange, _, _ in

            guard let self = self, let substring = substring else { return }

            buffer.append(substring)

            self.language.delimiter.forEach { delimiter in
                if buffer.suffix(delimiter.count).lowercased() == delimiter, 
                    let index = buffer.index(buffer.endIndex, offsetBy: -delimiter.count - 1, limitedBy: buffer.startIndex),
                    buffer[index] == " " {
                    buffer = String(
                        buffer
                            .dropLast(delimiter.count)
                            .trimmingCharacters(in: .whitespacesAndNewlines)
                    )
                    tokens.append(buffer)
                    buffer = delimiter
                }
            }

            if substringRange.upperBound == text.endIndex {
                tokens.append(buffer)
            }
        }

        return tokens
    }
}
