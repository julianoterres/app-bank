//
//  ProductsSpotlightCell.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

// MARK: Methods of ProductsSpotlightCellDelegate

protocol ProductsSpotlightCellDelegate: AnyObject {
  func didTapProductSpotlight(indexPath: IndexPath)
}

// MARK: Methods of ProductsSpotlightCell

class ProductsSpotlightCell: UICollectionViewCell {

  // MARK: Public Properties

  weak var delegate: ProductsSpotlightCellDelegate?

  var data: ProductsSpotlightCellViewEntity? {
    didSet {
      collectionView.reloadData()
    }
  }

  // MARK: Views

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 16
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 24)
    collectionView.collectionViewLayout = layout
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .clear
    collectionView.register(FullBannerCell.self)
    collectionView.delegate = self
    collectionView.dataSource = self
    return collectionView
  }()

  // MARK: Lifecycle Methods

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func preferredLayoutAttributesFitting(
    _ layoutAttributes: UICollectionViewLayoutAttributes
  ) -> UICollectionViewLayoutAttributes {
    let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
    attributes.size.width = self.superview?.bounds.width ?? 0
    attributes.size.height = 232
    return attributes
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    data = nil
  }

  // MARK: Private Methods

  private func collectionViewSetupConstraints() {
    collectionView.addConstraint(attribute: .left,
                                 alignElement: contentView,
                                 alignElementAttribute: .left,
                                 constant: 0)
    collectionView.addConstraint(attribute: .right,
                                 alignElement: contentView,
                                 alignElementAttribute: .right,
                                 constant: 0)
    collectionView.addConstraint(attribute: .top,
                                 alignElement: contentView,
                                 alignElementAttribute: .top,
                                 constant: 0)
    collectionView.addConstraint(attribute: .bottom,
                                 alignElement: contentView,
                                 alignElementAttribute: .bottom,
                                 constant: 0)

  }

}

// MARK: Methods of Code View

extension ProductsSpotlightCell: CodeView {

  func buildViewHierarchy() {
    contentView.addSubview(collectionView)
  }

  func setupConstraints() {
    collectionViewSetupConstraints()
  }

  func setupAditionalConfiguration() {
    contentView.backgroundColor = .white
  }

}

// MARK: Methods of UICollectionViewDelegate and UICollectionViewDataSource

extension ProductsSpotlightCell: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data?.banners.count ?? 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: FullBannerCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
    cell.bannerURL = data?.banners[indexPath.row]
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.didTapProductSpotlight(indexPath: indexPath)
  }

}
