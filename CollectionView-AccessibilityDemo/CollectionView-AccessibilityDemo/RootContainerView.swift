//
//  RootContainerView.swift
//  CollectionView-AccessibilityDemo
//
//  Created by Geetesh Mandaogade on 05/02/26.
//

import UIKit

class RootContainerView: UIView {

    private let headerView = HeaderContainerView()
    private let contentView = ContentContainerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        bindActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(headerView)
        addSubview(contentView)
    }

    private func setupConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Header container
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),

            // Content container
            contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func bindActions() {
        headerView.onButtonTap = { [weak self] in
            self?.contentView.scrollToNextCell()
        }
    }
}
