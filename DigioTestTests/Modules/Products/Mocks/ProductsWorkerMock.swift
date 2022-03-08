//
//  ProductsWorkerMock.swift
//  DigioTestTests
//
//  Created by Juliano Terres on 08/03/22.
//

@testable import DigioTest

// MARK: Methods of ProductsWorkerMock

class ProductsWorkerMock: ProductsInteractorToWorkerProtocol {

  private(set) var fetchCalled = false

  func fetch() {
    fetchCalled = true
  }

}
