//
//  ProductsInteractorTests.swift
//  DigioTestTests
//
//  Created by Juliano Terres on 08/03/22.
//

import XCTest
@testable import DigioTest

// MARK: Methods of ProductsInteractorTests

class ProductsInteractorTests: XCTestCase {

  // MARK: Private Properties

  private var interactor: ProductsInteractor!
  private var worker: ProductsWorkerMock!
  private var presenter: ProductsPresenterMock!
  private var productsList: ProductListEntity!

  // MARK: Setups

  override func setUp() {
    super.setUp()
    presenter = ProductsPresenterMock()
    worker = ProductsWorkerMock()
    interactor = ProductsInteractor(
      worker: worker
    )
    interactor.presenter = presenter
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

  // MARK: Tests of ProductsPresenterToInteractorProtocol

  func testFetch() {
    interactor.fetch()
    XCTAssertTrue(worker.fetchCalled)
  }

  // MARK: Tests of ProductsWorkerToInteractorProtocol

  func testDidFetchSuccess() {
    setupProductList()
    interactor.didFetchSuccess(products: productsList)
    XCTAssertTrue(presenter.didFetchSuccessCalled)
  }

  func testDidFetchFailure() {
    interactor.didFetchFailure()
    XCTAssertTrue(presenter.didFetchFailureCalled)
  }

}
