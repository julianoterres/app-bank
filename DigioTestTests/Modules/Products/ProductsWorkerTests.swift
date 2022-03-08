//
//  ProductsWorkerTests.swift
//  DigioTestTests
//
//  Created by Juliano Terres on 08/03/22.
//

import XCTest
@testable import DigioTest

// MARK: Methods of ProductsWorkerTests

class ProductsWorkerTests: XCTestCase {

  // MARK: Private Properties

  private var worker: ProductsWorker!
  private var interactor: ProductsInteractorMock!
  private var productService: ProductServiceMock!
  private var productsList: ProductListEntity!

  // MARK: Setups

  override func setUp() {
    super.setUp()
    productService = ProductServiceMock()
    interactor = ProductsInteractorMock()
    worker = ProductsWorker(
      productService: productService
    )
    worker.interactor = interactor
  }

  // MARK: Private Methods

  private func setupProductList() {
    let spolight = [ProductSpotlightEntity(
      name: "name",
       bannerURL: "banner",
       description: "description"
    )]
    let products = [ProductEntity(
      name: "name",
      imageURL: "image",
      description: "description"
    )]
    let cash = ProductCashEntity(
      title: "title",
      bannerURL: "banner",
      description: "description"
    )
    productsList = ProductListEntity(
      spotlight: spolight,
      products: products,
      cash: cash
    )
  }

  // MARK: Tests of ProductsInteractorToWorkerProtocol

  func testFetchSuccess() {
    setupProductList()
    productService.fetchResult = .success(productsList)
    worker.fetch()
    XCTAssertTrue(interactor.didFetchSuccessCalled)
  }

  func testFetchFailure() {
    productService.fetchResult = .failure(.invalidRequest)
    worker.fetch()
    XCTAssertTrue(interactor.didFetchFailureCalled)
  }

}
