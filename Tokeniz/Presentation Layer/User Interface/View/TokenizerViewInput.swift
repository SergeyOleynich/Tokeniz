//
//  TokenizerViewInput.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 11.01.2024.
//

import Foundation

protocol TokenizerViewInput: AnyObject {
    func didProcessItem(item: TokenDisplayModel)
}
