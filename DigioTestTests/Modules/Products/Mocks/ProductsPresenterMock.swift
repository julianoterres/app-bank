//
//  ProductsPresenterMock.swift
//  DigioTestTests
//
//  Created by Juliano Terres on 08/03/22.
//

@testable import DigioTest

// MARK: Methods of ProductsInteractorToPresenterProtocol

class ProductsPresenterMock: ProductsInteractorToPresenterProtocol {

  private(set) var didFetchSuccessCalled = false

  func didFetchSuccess(products: ProductListEntity) {
    didFetchSuccessCalled = true
  }

  private(set) var didFetchFailureCalled = false

  func didFetchFailure() {
    didFetchFailureCalled = true
  }

}
