//
//  ProductsCell.swift
//  DigioTest
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of ProductsCellDelegate

protocol ProductsCellDelegate: AnyObject {
  func didTapProduct(indexPath: IndexPath)
}

// MARK: Methods of ProductsCashCell

class ProductsCell: UICollectionViewCell {

  // MARK: Public Properties

  weak var delegate: ProductsCellDelegate?
  var data: ProductsCellViewEntity?

  // MARK: Views

  lazy var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.font = .systemFont(ofSize: 24)
    titleLabel.textColor = .black
    titleLabel.text = "Produtos"
    return titleLabel
  }()

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
    collectionView.register(ProductBannerCell.self)
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
    return attributes
  }

  override func prepareForReuse() {
    super.prepareForReuse()

  }

  // MARK: Private Methods

  private func titleLabelSetupConstraints() {
    titleLabel.addConstraint(attribute: .left,
                             alignElement: contentView,
                             alignElementAttribute: .left,
                             constant: 16)
    titleLabel.addConstraint(attribute: .right,
                             alignElement: contentView,
                             alignElementAttribute: .right,
                             constant: 0)
    titleLabel.addConstraint(attribute: .top,
                             alignElement: contentView,
                             alignElementAttribute: .top,
                             constant: 0)
  }

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
                                 alignElement: titleLabel,
                                 alignElementAttribute: .bottom,
                                 constant: 8)
    collectionView.addConstraint(attribute: .bottom,
                                 alignElement: contentView,
                                 alignElementAttribute: .bottom,
                                 constant: 0)
    collectionView.addConstraint(attribute: .height,
                                 constant: 116)
  }

}

// MARK: Methods of Code View

extension ProductsCell: CodeView {

  func buildViewHierarchy() {
    contentView.addSubview(titleLabel)
    contentView.addSubview(collectionView)
  }

  func setupConstraints() {
    titleLabelSetupConstraints()
    collectionViewSetupConstraints()
  }

  func setupAditionalConfiguration() {
    contentView.backgroundColor = .white
  }

}

// MARK: Methods of UICollectionViewDelegate and UICollectionViewDataSource

extension ProductsCell: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data?.banners.count ?? 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: ProductBannerCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
    cell.bannerURL = data?.banners[indexPath.row]
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.didTapProduct(indexPath: indexPath)
  }

}
