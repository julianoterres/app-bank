//
//  ProductsCashCell.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

// MARK: Methods of ProductsCashCellDelegate

protocol ProductsCashCellDelegate: AnyObject {
  func didTapProductCash()
}

// MARK: Methods of ProductsCashCell

class ProductsCashCell: UICollectionViewCell {

  // MARK: Public Properties

  weak var delegate: ProductsCashCellDelegate?

  var data: ProductsCashCellViewEntity? {
    didSet {
      imageView.downloaded(url: data?.bannerURL, contentMode: .scaleAspectFill)
    }
  }

  // MARK: Views

  lazy var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.font = .systemFont(ofSize: 24)
    titleLabel.textColor = .black
    let text = "digio Cash"
    let customStrings = [AttributedStringCustom(findString: "Cash", color: .gray, font: .systemFont(ofSize: 24))]
    titleLabel.attributedText = text.attributedStringCustom(strings: customStrings)
    return titleLabel
  }()

  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 8
    imageView.clipsToBounds = true
    return imageView
  }()

  lazy var button: UIButton = {
    let button = UIButton()
    return button
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
    data = nil
    delegate = nil
  }

  // MARK: Private Methods

  private func titleLabelSetupConstraints() {
    titleLabel.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 16)
    titleLabel.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 0)
    titleLabel.addConstraint(attribute: .top, alignElement: contentView, alignElementAttribute: .top, constant: 0)
  }

  private func imageViewSetupConstraints() {
    imageView.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 16)
    imageView.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 16)
    imageView.addConstraint(attribute: .top, alignElement: titleLabel, alignElementAttribute: .bottom, constant: 16)
    imageView.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 16)
    imageView.addConstraint(attribute: .height, constant: 100)
  }

  private func buttonSetupConstraints() {
    button.addConstraint(attribute: .left, alignElement: imageView, alignElementAttribute: .left, constant: 0)
    button.addConstraint(attribute: .right, alignElement: imageView, alignElementAttribute: .right, constant: 0)
    button.addConstraint(attribute: .top, alignElement: imageView, alignElementAttribute: .top, constant: 0)
    button.addConstraint(attribute: .bottom, alignElement: imageView, alignElementAttribute: .bottom, constant: 0)
  }

  @objc func didTapButton(_ sender: UIButton) {
    delegate?.didTapProductCash()
  }

}

// MARK: Methods of Code View

extension ProductsCashCell: CodeView {

  func buildViewHierarchy() {
    contentView.addSubview(titleLabel)
    contentView.addSubview(imageView)
    contentView.addSubview(button)
  }

  func setupConstraints() {
    titleLabelSetupConstraints()
    imageViewSetupConstraints()
    buttonSetupConstraints()
  }

  func setupAditionalConfiguration() {
    contentView.backgroundColor = .white
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
  }

}
