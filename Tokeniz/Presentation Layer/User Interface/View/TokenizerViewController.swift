//
//  TokenizerViewController.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 11.01.2024.
//

import UIKit

private enum Constants {
    static let inputViewHeight: CGFloat = 100.0
    static let elementSpacing: CGFloat = 16.0
}

final class TokenizerViewController: UIViewController {
    var output: TokenizerViewOutput!

    private lazy var tokenizerInputView: UIView = {
        let view = TokenizerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false

        view.delegate = self
        view.spacing = Constants.elementSpacing
        view.title = "Input"

        return view
    }()

    private lazy var tokenizerOutputView: TokenizerView = {
        let view = TokenizerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false

        view.spacing = Constants.elementSpacing
        view.title = "Output"
        view.isUserInteractionEnabled = false

        return view
    }()

    override func loadView() {
        let contentView = UIView()
        contentView.backgroundColor = UIColor.systemBackground
        
        contentView.addSubview(tokenizerInputView)
        contentView.addSubview(tokenizerOutputView)

        self.view = contentView

        setupConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }
}

// MARK: - TokenizerViewInput

extension TokenizerViewController: TokenizerViewInput {
    func didProcessItem(item: TokenDisplayModel) {
        tokenizerOutputView.text = item.displayString
    }
}

// MARK: - UITextViewDelegate

extension TokenizerViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)

        output.onTextDidChanged(text: updatedText)

        return true
    }
}

// MARK: - Private

private extension TokenizerViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tokenizerInputView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tokenizerInputView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tokenizerInputView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            tokenizerInputView.heightAnchor.constraint(equalToConstant: Constants.inputViewHeight),

            tokenizerOutputView.topAnchor.constraint(equalTo: tokenizerInputView.bottomAnchor, constant: Constants.elementSpacing),
            tokenizerOutputView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tokenizerOutputView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            tokenizerOutputView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -Constants.elementSpacing)
        ])
    }

    func setupNavigationBar() {
        let languageAction = UIAction(title: "Language") { _ in  }

        let rightMenu = UIMenu(children: [languageAction])
        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape.fill"),
            menu: rightMenu)

        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Tokenizer"
    }
}
