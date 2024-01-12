//
//  TokenizerCoordinator.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 12.01.2024.
//

import Foundation
import UIKit.UINavigationController

protocol TokenizerCoordinator {
    func start()
}

// MARK: - Implementation

struct TokenizerCoordinatorImpl: TokenizerCoordinator {
    private let assembly: TokenizerAssembly

    init(assembly: TokenizerAssembly) {
        self.assembly = assembly
    }

    func start() {
        assembly.window?.rootViewController = UINavigationController(
            rootViewController: assembly.moduleInput)
        assembly.window?.makeKeyAndVisible()
    }
}
