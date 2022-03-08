//
//  CodeViewProtocol.swift
//  DigioTest
//
//  Created by Juliano Terres on 04/03/22.
//

protocol CodeView {
  func buildViewHierarchy()
  func setupConstraints()
  func setupAditionalConfiguration()
  func setupView()
}

extension CodeView {

  func setupView() {
    buildViewHierarchy()
    setupConstraints()
    setupAditionalConfiguration()
  }

}
