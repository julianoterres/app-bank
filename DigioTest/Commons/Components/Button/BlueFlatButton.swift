//
//  BlueFlatButton.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

class BlueFlatButton: UIButton {

  // MARK: Inicialization

  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

// MARK: Methods of Code View Protocol

extension BlueFlatButton: CodeView {

  func buildViewHierarchy() {
  }

  func setupConstraints() {
  }

  func setupAditionalConfiguration() {
    setTitleColor(.white, for: .normal)
    titleLabel?.font = .systemFont(ofSize: 14)
    backgroundColor = .blue1
    layer.cornerRadius = 4
  }

}
