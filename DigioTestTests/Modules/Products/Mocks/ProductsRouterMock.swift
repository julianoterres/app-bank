//
//  ProductsRouterMock.swift
//  DigioTestTests
//
//  Created by Juliano Terres on 08/03/22.
//

@testable import DigioTest

// MARK: Methods of ProductsPresenterToRouterProtocol

class ProductsRouterMock: ProductsPresenterToRouterProtocol {

  private(set) var presentProductDetailsCalled = false

  func presentProductDetails(data: ProductDetailsData) {
    presentProductDetailsCalled = true
  }

}
