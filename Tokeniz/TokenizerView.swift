//
//  TokenizerView.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 11.01.2024.
//

import UIKit

final class TokenizerView: UIView {
    var spacing: CGFloat = 8.0 {
        didSet {
            stackView.spacing = spacing
        }
    }

    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }

    override var isUserInteractionEnabled: Bool {
        didSet {
            textView.isEditable = isUserInteractionEnabled
        }
    }

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = spacing
        
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        return titleLabel
    }()

    private lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.label.cgColor

        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        preconditionFailure()
    }
}

// MARK: - Public

extension TokenizerView {

}

// MARK: - Private

private extension TokenizerView {
    func setupViews() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textView)

        addSubview(stackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
