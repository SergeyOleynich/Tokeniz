//
//  String+Extension.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 12.01.2024.
//

import Foundation

extension String {
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
    var hyphen: String { "- " + self }
}
