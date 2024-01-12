//
//  Tokenizer.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 12.01.2024.
//

import Foundation

protocol Tokenizer {
    var language: Language { get set }
    
    func tokenize(text: String) -> [String]
}
