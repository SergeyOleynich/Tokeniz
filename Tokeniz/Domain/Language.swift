//
//  Language.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 12.01.2024.
//

import Foundation

enum Language {
    case english
    case spanish
}

extension Language {
    var delimiter: [String] {
        switch self {
        case .english:
            return ["and", "if"]
        case .spanish:
            return ["si", "y"]
        }
    }
}
