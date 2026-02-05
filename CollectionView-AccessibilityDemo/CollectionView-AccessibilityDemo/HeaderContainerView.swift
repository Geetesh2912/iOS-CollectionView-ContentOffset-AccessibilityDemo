//
//  HeaderContainerView.swift
//  CollectionView-AccessibilityDemo
//
//  Created by Geetesh Mandaogade on 05/02/26.
//

import UIKit

class HeaderContainerView: UIView {

    let titleLabel = UILabel()
    let actionButton = UIButton(type: .system)

    var onButtonTap: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(titleLabel)
        addSubview(actionButton)

        titleLabel.text = "Header"
        actionButton.setTitle("Scroll", for: .normal)

        actionButton.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )
    }

    @objc private func buttonTapped() {
        onButtonTap?()
    }

    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Title label
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            // Action button
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            // Prevent overlap
            titleLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: actionButton.leadingAnchor,
                constant: -12
            )
        ])
    }
}
