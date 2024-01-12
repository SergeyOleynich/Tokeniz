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
    var moduleInput: (viewController: UIViewController, presenter: TokenizerPresenter) { get }
    var languageInput: UIViewController { get }
}

// MARK: - Implementation

struct TokenizerAssemblyImpl: TokenizerAssembly {
    private(set) var window: UIWindow?

    var coordinator: TokenizerCoordinator { TokenizerCoordinatorImpl(assembly: self) }

    init(window: UIWindow? = nil) {
        self.window = window
    }

    var moduleInput: (viewController: UIViewController, presenter: TokenizerPresenter) {
        let viewController = TokenizerViewController()
        let presenter = TokenizerPresenter(
            tokenizer: TokenizerService(),
            displayItemProvider: TokenDisplayItemProviderImpl())

        presenter.viewInput = viewController
        viewController.output = presenter

        return (viewController, presenter)
    }

    var languageInput: UIViewController {
        let alert = UIAlertController(
            title: "Language",
            message: "Please Select an Option",
            preferredStyle: .actionSheet)

        let englishAction = UIAlertAction(
            title: "✔︎ English",
            style: .default) { _ in }

        let spanishAction = UIAlertAction(
            title: "Spanish",
            style: .default) { _ in }

        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
        }

        alert.addAction(englishAction)
        alert.addAction(spanishAction)
        alert.addAction(cancelAction)

        return alert
    }
}
