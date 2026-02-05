//
//  ContentContainerView.swift
//  CollectionView-AccessibilityDemo
//
//  Created by Geetesh Mandaogade on 05/02/26.
//

import UIKit

class ContentContainerView: UIView {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private var currentIndex = 0

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(collectionView)
        collectionView.register(
            ListContainerCollectionCell.self,
            forCellWithReuseIdentifier: "ListContainerCollectionCell"
        )
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }

    func scrollToNextCell() {
        currentIndex = (currentIndex + 1) % 2
        let indexPath = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(
            at: indexPath,
            at: .centeredHorizontally,
            animated: true
        )
    }

    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ContentContainerView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ListContainerCollectionCell",
            for: indexPath
        ) as! ListContainerCollectionCell

        let type: ListType = indexPath.item == 0 ? .numbers : .alphabets
        cell.configure(type: type)
        return cell
    }
}

extension ContentContainerView: UICollectionViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateCurrentIndex()
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        updateCurrentIndex()
    }

    private func updateCurrentIndex() {
        let pageWidth = collectionView.frame.width
        guard pageWidth > 0 else { return }

        let index = Int(collectionView.contentOffset.x / pageWidth)
        currentIndex = index
    }
}

extension ContentContainerView: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return collectionView.bounds.size
    }
}
