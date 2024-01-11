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
    
    private lazy var tokenizerInputView: UIView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = Constants.elementSpacing

        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Input"

        stackView.addArrangedSubview(titleLabel)

        let inputTextView = UITextView(frame: .zero)
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        inputTextView.layer.borderWidth = 1.0
        inputTextView.layer.borderColor = UIColor.label.cgColor

        stackView.addArrangedSubview(inputTextView)

        return stackView
    }()

    private lazy var tokenizerOutputView: UIView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = Constants.elementSpacing

        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Output"

        stackView.addArrangedSubview(titleLabel)

        let outputTextView = UITextView(frame: .zero)
        outputTextView.translatesAutoresizingMaskIntoConstraints = false
        outputTextView.layer.borderWidth = 1.0
        outputTextView.layer.borderColor = UIColor.label.cgColor
        outputTextView.isEditable = false
        outputTextView.isUserInteractionEnabled = false

        stackView.addArrangedSubview(outputTextView)

        return stackView
    }()

    override func loadView() {
        let contentView = UIView()

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
            tokenizerOutputView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
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
