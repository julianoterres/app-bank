//
//  ProductsPresenter.swift
//  DigioTest
//
//  Created by Juliano Terres on 03/03/22.
//

import Foundation

// MARK: Methods of ProductsPresenter

class ProductsPresenter: ProductsPresenterProtocol {

  // MARK: Private Properties

  weak var viewController: ProductsPresenterToViewControllerProtocol?
  private let interactor: ProductsPresenterToInteractorProtocol
  private let router: ProductsPresenterToRouterProtocol
  var products: ProductListEntity?

  // MARK: Public Properties

  private(set) var viewEntity = ProductsViewEntity()

  // MARK: Inicialization

  init(
    interactor: ProductsPresenterToInteractorProtocol,
    router: ProductsPresenterToRouterProtocol
  ) {
    self.interactor = interactor
    self.router = router
  }

  // MARK: Private Methods

  private func setupHeaderUser() {
    viewEntity.headerUser = "Olá, Maria"
    viewController?.setupUserName()
  }

}

// MARK: Methods of ProductsViewControllerToPresenterProtocol

extension ProductsPresenter: ProductsViewControllerToPresenterProtocol {

  func viewDidLoad() {
    setupHeaderUser()
    interactor.fetch()
  }

  func didTapTryAgain() {
    viewController?.showLoader()
    viewController?.hideError()
    interactor.fetch()
  }

  func didTapProductCash() {
    guard let products = products else { return }
    router.presentProductDetails(data: ProductDetailsData(
      name: products.cash.title,
      description: products.cash.description
    ))
  }

  func didTapProductSpotlight(indexPath: IndexPath) {
    guard let product = products?.spotlight[indexPath.row] else { return }
    router.presentProductDetails(data: ProductDetailsData(
      name: product.name,
      description: product.description
    ))
  }

  func didTapProduct(indexPath: IndexPath) {
    guard let product = products?.products[indexPath.row] else { return }
    router.presentProductDetails(data: ProductDetailsData(
      name: product.name,
      description: product.description
    ))
  }

}

// MARK: Methods of ProductsInteractorToPresenterProtocol

extension ProductsPresenter: ProductsInteractorToPresenterProtocol {

  func didFetchSuccess(products: ProductListEntity) {
    self.products = products
    let spotlights = ProductsSpotlightCellViewEntity(banners: products.spotlight.map { URL(string: $0.bannerURL) })
    let cash = ProductsCashCellViewEntity(bannerURL: URL(string: products.cash.bannerURL))
    let products = ProductsCellViewEntity(banners: products.products.map { URL(string: $0.imageURL) })
    viewEntity.products.append(spotlights)
    viewEntity.products.append(cash)
    viewEntity.products.append(products)
    viewController?.reloadData()
    viewController?.hideLoader()
    viewController?.showCollection()
  }

  func didFetchFailure() {
    viewController?.hideLoader()
    viewController?.showError(
      title: "Ops!",
      message: "Tivemos um problema ao buscar os produtos."
    )
  }

}
