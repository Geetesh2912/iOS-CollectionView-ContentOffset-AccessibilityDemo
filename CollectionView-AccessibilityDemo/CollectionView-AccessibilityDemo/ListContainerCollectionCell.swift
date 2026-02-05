//
//  ListContainerCollectionCell.swift
//  CollectionView-AccessibilityDemo
//
//  Created by Geetesh Mandaogade on 05/02/26.
//

import UIKit

class ListContainerCollectionCell: UICollectionViewCell {

    private let tableView = UITableView()
    private var dataSource: [String] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(type: ListType) {
        switch type {
            case .numbers:
                dataSource = (1...20).map { "\($0)" }
            case .alphabets:
                dataSource = (65...84).map { String(UnicodeScalar($0)!) }
        }
        tableView.reloadData()
    }

    private func setupView() {
        contentView.addSubview(tableView)
        tableView.dataSource = self
    }

    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension ListContainerCollectionCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cellIdentifier = "BasicCell"

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)

        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
}
