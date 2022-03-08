//
//  ProductDetailsPresenter.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import Foundation

// MARK: Methods of ProductDetailsPresenter

class ProductDetailsPresenter: ProductDetailsPresenterProtocol {

  // MARK: Private Properties

  weak var viewController: ProductDetailsPresenterToViewControllerProtocol?
  private let interactor: ProductDetailsPresenterToInteractorProtocol
  private let router: ProductDetailsPresenterToRouterProtocol

  // MARK: Public Properties

  private(set) var viewEntity = ProductDetailsViewEntity()

  // MARK: Inicialization

  init(
    viewEntityInitData: ProductDetailsData,
    interactor: ProductDetailsPresenterToInteractorProtocol,
    router: ProductDetailsPresenterToRouterProtocol
  ) {
    self.viewEntity.name = viewEntityInitData.name
    self.viewEntity.description = viewEntityInitData.description
    self.interactor = interactor
    self.router = router
  }

}

// MARK: Methods of ProductDetailsViewControllerToPresenterProtocol

extension ProductDetailsPresenter: ProductDetailsViewControllerToPresenterProtocol {

  func viewDidLoad() {
    viewController?.setupTitle()
    viewController?.setupDescription()
  }

}

// MARK: Methods of ProductDetailsInteractorToPresenterProtocol

extension ProductDetailsPresenter: ProductDetailsInteractorToPresenterProtocol {
}
