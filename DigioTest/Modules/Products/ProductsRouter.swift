//
//  ProductsRouter.swift
//  DigioTest
//
//  Created by Juliano Terres on 03/03/22.
//

import UIKit

// MARK: Methods of ProductsRouter

class ProductsRouter: ProductsRouterProtocol {

  // MARK: Private Properties

  weak var viewController: UIViewController?

  func build() -> UIViewController {

    let network = Network()

    let productService = ProductService(
      network: network
    )

    let worker = ProductsWorker(
      productService: productService
    )

    let interactor = ProductsInteractor(
      worker: worker
    )

    let presenter = ProductsPresenter(
      interactor: interactor,
      router: self
    )

    let viewController = ProductsViewController(
      presenter: presenter
    )

    presenter.viewController = viewController
    interactor.presenter = presenter
    worker.interactor = interactor
    self.viewController = viewController

    return viewController

  }

}

// MARK: Methods of ProductsPresenterToRouterProtocol

extension ProductsRouter: ProductsPresenterToRouterProtocol {

  func presentProductDetails(data: ProductDetailsData) {
    let productDetailsViewController = ProductDetailsRouter().build(data: data)
    viewController?.navigationController?.pushViewController(productDetailsViewController, animated: true)
  }

}
