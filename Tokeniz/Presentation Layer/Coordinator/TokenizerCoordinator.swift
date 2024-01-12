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

protocol TokenizerRouter {
    func presentLanguageSelection()
}

// MARK: - Implementation

struct TokenizerCoordinatorImpl: TokenizerCoordinator {
    private let assembly: TokenizerAssembly

    init(assembly: TokenizerAssembly) {
        self.assembly = assembly
    }

    func start() {
        let moduleInput = assembly.moduleInput
        assembly.window?.rootViewController = UINavigationController(
            rootViewController: moduleInput.viewController)
        moduleInput.presenter.router = self
        assembly.window?.makeKeyAndVisible()
    }
}

// MARK: - TokenizerRouter

extension TokenizerCoordinatorImpl: TokenizerRouter {
    func presentLanguageSelection() {
        let languageInput = assembly.languageInput

        assembly.window?.rootViewController?.present(languageInput, animated: true) { }
    }
}
