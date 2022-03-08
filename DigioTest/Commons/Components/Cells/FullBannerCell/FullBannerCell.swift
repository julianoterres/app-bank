//
//  FullBannerCell.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

// MARK: Methods of FullBannerCell

class FullBannerCell: UICollectionViewCell {

  // MARK: Public Properties

  var bannerURL: URL? {
    didSet {
      imageView.downloaded(url: bannerURL, contentMode: .scaleAspectFill)
    }
  }

  // MARK: Views

  lazy var contentImageView: UIView = {
    let contentImageView = UIView()
    contentImageView.layer.cornerRadius = 8
    contentImageView.shadow(opaccity: 0.7, offSet: CGSize(width: 0, height: 0), radius: 4, color: .black)
    return contentImageView
  }()

  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 8
    imageView.clipsToBounds = true
    return imageView
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
    attributes.size.width = ((self.superview?.bounds.width ?? 0) - 48)
    attributes.size.height = 200
    return attributes
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    bannerURL = nil
    imageView.image = nil
  }

  // MARK: Private Methods

  private func contentImageViewSetupConstraints() {
    contentImageView.addConstraint(attribute: .left,
                                   alignElement: contentView,
                                   alignElementAttribute: .left,
                                   constant: 0)
    contentImageView.addConstraint(attribute: .right,
                                   alignElement: contentView,
                                   alignElementAttribute: .right,
                                   constant: 0)
    contentImageView.addConstraint(attribute: .top,
                                   alignElement: contentView,
                                   alignElementAttribute: .top,
                                   constant: 0)
    contentImageView.addConstraint(attribute: .bottom,
                                   alignElement: contentView,
                                   alignElementAttribute: .bottom,
                                   constant: 0)
  }

  private func imageViewSetupConstraints() {
    imageView.addConstraint(attribute: .left,
                            alignElement: contentImageView,
                            alignElementAttribute: .left,
                            constant: 0)
    imageView.addConstraint(attribute: .right,
                            alignElement: contentImageView,
                            alignElementAttribute: .right,
                            constant: 0)
    imageView.addConstraint(attribute: .top,
                            alignElement: contentImageView,
                            alignElementAttribute: .top,
                            constant: 0)
    imageView.addConstraint(attribute: .bottom,
                            alignElement: contentImageView,
                            alignElementAttribute: .bottom,
                            constant: 0)
  }

}

// MARK: Methods of Code View

extension FullBannerCell: CodeView {

  func buildViewHierarchy() {
    contentView.addSubview(contentImageView)
    contentImageView.addSubview(imageView)

  }

  func setupConstraints() {
    contentImageViewSetupConstraints()
    imageViewSetupConstraints()
  }

  func setupAditionalConfiguration() {

  }

}
