//
//  TokenizerAssembly.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 12.01.2024.
//

import Foundation
import UIKit.UIWindow
import UIKit.UIViewController

protocol TokenizerAssembly {
    var window: UIWindow? { get }

    var coordinator: TokenizerCoordinator { get }
    var moduleInput: UIViewController { get }
}

// MARK: - Implementation

struct TokenizerAssemblyImpl: TokenizerAssembly {
    private(set) var window: UIWindow?

    var coordinator: TokenizerCoordinator { TokenizerCoordinatorImpl(assembly: self) }

    init(window: UIWindow? = nil) {
        self.window = window
    }

    var moduleInput: UIViewController {
        let viewController = TokenizerViewController()
        let presenter = TokenizerPresenter(
            tokenizer: TokenizerService(),
            displayItemProvider: TokenDisplayItemProviderImpl())

        presenter.viewInput = viewController
        viewController.output = presenter

        return viewController
    }
}
