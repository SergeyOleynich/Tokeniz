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
    func languageInput(for language: Language, completion: @escaping ((Language) -> Void)) -> UIViewController
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

    func languageInput(for language: Language, completion: @escaping ((Language) -> Void)) -> UIViewController {
        let alert = UIAlertController(
            title: "Language",
            message: "Please Select an Option",
            preferredStyle: .actionSheet)

        let englishAction = UIAlertAction(
            title: "\(language == .english ? "✔︎ " : "") \(Language.english.title)",
            style: .default) { _ in completion(.english) }

        let spanishAction = UIAlertAction(
            title: "\(language == .spanish ? "✔︎ " : "") \(Language.spanish.title)",
            style: .default) { _ in completion(.spanish) }

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
