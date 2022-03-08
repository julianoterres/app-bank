//
//  UserLoggedView.swift
//  DigioTest
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of UserLoggedView

class UserLoggedView: UIView {

  // MARK: Views

  lazy var iconImageView: UIImageView = {
    let iconImageView = UIImageView()
    iconImageView.image = UIImage(named: "digio-header-icon")
    return iconImageView
  }()

  lazy var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.font = .systemFont(ofSize: 16)
    titleLabel.textColor = .black
    return titleLabel
  }()

  // MARK: Inicialization

  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private Functions

  private func iconImageViewSetupConstraints() {
    iconImageView.addConstraint(attribute: .left, alignElement: self, alignElementAttribute: .left, constant: 0)
    iconImageView.addConstraint(attribute: .top, alignElement: self, alignElementAttribute: .top, constant: 0)
    iconImageView.addConstraint(attribute: .bottom, alignElement: self, alignElementAttribute: .bottom, constant: 0)
    iconImageView.addConstraint(attribute: .width, constant: 25)
    iconImageView.addConstraint(attribute: .height, constant: 25)
  }

  private func titleLabelSetupConstraints() {
    titleLabel.addConstraint(attribute: .left, alignElement: iconImageView, alignElementAttribute: .right, constant: 8)
    titleLabel.addConstraint(attribute: .right, alignElement: self, alignElementAttribute: .right, constant: 0)
    titleLabel.addConstraint(attribute: .top, alignElement: self, alignElementAttribute: .top, constant: 0)
    titleLabel.addConstraint(attribute: .bottom, alignElement: self, alignElementAttribute: .bottom, constant: 0)
  }

}

// MARK: Methods of Code View Protocol

extension UserLoggedView: CodeView {

  func buildViewHierarchy() {
    addSubview(iconImageView)
    addSubview(titleLabel)
  }

  func setupConstraints() {
    iconImageViewSetupConstraints()
    titleLabelSetupConstraints()
  }

  func setupAditionalConfiguration() {

  }

}
