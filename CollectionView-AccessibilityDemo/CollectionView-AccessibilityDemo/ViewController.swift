//
//  ViewController.swift
//  CollectionView-AccessibilityDemo
//
//  Created by Geetesh Mandaogade on 05/02/26.
//

import UIKit


enum ListType {
    case numbers
    case alphabets
}

class ViewController: UIViewController {

    private let rootContainerView = RootContainerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(rootContainerView)
    }

    private func setupConstraints() {
        rootContainerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            rootContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rootContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

