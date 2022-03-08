//
//  ProductsViewControllerMock.swift
//  DigioTestTests
//
//  Created by Juliano Terres on 08/03/22.
//

@testable import DigioTest

// MARK: Methods of ProductsViewControllerMock

class ProductsViewControllerMock: ProductsPresenterToViewControllerProtocol {

  private(set) var showLoaderCalled = false

  func showLoader() {
    showLoaderCalled = true
  }

  private(set) var hideLoaderCalled = false

  func hideLoader() {
    hideLoaderCalled = true
  }

  private(set) var showErrorCalled = false

  func showError(title: String, message: String) {
    showErrorCalled = true
  }

  private(set) var hideErrorCalled = false

  func hideError() {
    hideErrorCalled = true
  }

  private(set) var showCollectionCalled = false

  func showCollection() {
    showCollectionCalled = true
  }

  private(set) var hideCollectionCalled = false

  func hideCollection() {
    hideCollectionCalled = true
  }

  private(set) var reloadDataCalled = false

  func reloadData() {
    reloadDataCalled = true
  }

  private(set) var setupUserNameCalled = false

  func setupUserName() {
    setupUserNameCalled = true
  }

}
