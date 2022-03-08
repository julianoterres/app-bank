//
//  ProductsInteractorMock.swift
//  DigioTestTests
//
//  Created by Juliano Terres on 08/03/22.
//

@testable import DigioTest

// MARK: Methods of ProductsPresenterToInteractorProtocol

class ProductsInteractorMock: ProductsPresenterToInteractorProtocol, ProductsWorkerToInteractorProtocol {

  private(set) var fetchCalled = false

  func fetch() {
    fetchCalled = true
  }

  private(set) var didFetchSuccessCalled = false

  func didFetchSuccess(products: ProductListEntity) {
    didFetchSuccessCalled = true
  }

  private(set) var didFetchFailureCalled = false

  func didFetchFailure() {
    didFetchFailureCalled = true
  }

}
