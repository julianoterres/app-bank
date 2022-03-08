//
//  ProductDetailsScreen.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

// MARK: Methods of ProductDetailsScreen

class ProductDetailsScreen: UIView {

  // MARK: Private Properties

  weak var delegate: ProductDetailsScreenToViewControllerProtocol?

  // MARK: Views

  lazy var descriptionLabel: UILabel = {
    let descriptionLabel = UILabel()
    descriptionLabel.font = .systemFont(ofSize: 14)
    descriptionLabel.textColor = .black
    descriptionLabel.numberOfLines = 0
    return descriptionLabel
  }()

  // MARK: Inicialization

  override init(frame: CGRect = .zero) {
    super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private Functions

  private func descriptionLabelSetupConstraints() {
    descriptionLabel.addConstraint(attribute: .left,
                                   alignElement: self,
                                   alignElementAttribute: .left,
                                   constant: 16)
    descriptionLabel.addConstraint(attribute: .right,
                                   alignElement: self,
                                   alignElementAttribute: .right,
                                   constant: 16)
    descriptionLabel.addConstraint(attribute: .top,
                                   alignElement: safeAreaLayoutGuide,
                                   alignElementAttribute: .top,
                                   constant: 16)
  }

}

// MARK: Methods of Code View Protocol

extension ProductDetailsScreen: CodeView {

  func buildViewHierarchy() {
    addSubview(descriptionLabel)
  }

  func setupConstraints() {
    descriptionLabelSetupConstraints()
  }

  func setupAditionalConfiguration() {
    backgroundColor = .white
  }

}
