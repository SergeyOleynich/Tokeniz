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
    func presentLanguageSelection(
        selectedLanguage: Language,
        completion: @escaping ((Language) -> Void))
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
    func presentLanguageSelection(
        selectedLanguage: Language,
        completion: @escaping ((Language) -> Void)) {
        let languageInput = assembly.languageInput(
            for: selectedLanguage,
            completion: completion)

        assembly.window?.rootViewController?.present(languageInput, animated: true) { }
    }
}
