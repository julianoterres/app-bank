//
//  ProductsPresenterTests.swift
//  DigioTestTests
//
//  Created by Juliano Terres on 08/03/22.
//

import XCTest
@testable import DigioTest

// MARK: Methods of ProductsPresenterTests

class ProductsPresenterTests: XCTestCase {

  // MARK: Private Properties

  private var presenter: ProductsPresenter!
  private var interactor: ProductsInteractorMock!
  private var router: ProductsRouterMock!
  private var viewController: ProductsViewControllerMock!
  private var productsList: ProductListEntity!

  // MARK: Setups

  override func setUp() {
    super.setUp()
    interactor = ProductsInteractorMock()
    router = ProductsRouterMock()
    viewController = ProductsViewControllerMock()
    presenter = ProductsPresenter(interactor: interactor,
                                  router: router)
    presenter.viewController = viewController
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

  // MARK: Tests of ProductsViewControllerToPresenterProtocol

  func testViewDidLoad() {
    presenter.viewDidLoad()
    XCTAssertTrue(interactor.fetchCalled)
    XCTAssertTrue(viewController.setupUserNameCalled)
    XCTAssertEqual(presenter.viewEntity.headerUser, "Olá, Maria")
  }

  func testDidTapTryAgain() {
    presenter.didTapTryAgain()
    XCTAssertTrue(viewController.showLoaderCalled)
    XCTAssertTrue(viewController.hideErrorCalled)
    XCTAssertTrue(interactor.fetchCalled)
  }

  func testDidTapProductCash() {
    setupProductList()
    presenter.products = productsList
    presenter.didTapProductCash()
    XCTAssertTrue(router.presentProductDetailsCalled)
  }

  func testDidTapProductSpotlight() {
    setupProductList()
    presenter.products = productsList
    presenter.didTapProductSpotlight(indexPath: IndexPath(row: 0, section: 0))
    XCTAssertTrue(router.presentProductDetailsCalled)
  }

  func testDidTapProduct() {
    setupProductList()
    presenter.products = productsList
    presenter.didTapProduct(indexPath: IndexPath(row: 0, section: 0))
    XCTAssertTrue(router.presentProductDetailsCalled)
  }

  // MARK: Tests of ProductsInteractorToPresenterProtocol

  func testDidFetchSuccess() {
    setupProductList()
    presenter.didFetchSuccess(products: productsList)
    XCTAssertNotNil(presenter.products)
    XCTAssertTrue(viewController.reloadDataCalled)
    XCTAssertTrue(viewController.hideLoaderCalled)
    XCTAssertTrue(viewController.showCollectionCalled)
  }

  func testDidFetchFailure() {
    presenter.didFetchFailure()
    XCTAssertTrue(viewController.hideLoaderCalled)
    XCTAssertTrue(viewController.showErrorCalled)
  }

}
