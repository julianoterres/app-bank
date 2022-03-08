//
//  ProductDetailsRouter.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

// MARK: Methods of ProductDetailsRouter

class ProductDetailsRouter: ProductDetailsRouterProtocol {

  // MARK: Private Properties

  weak var viewController: UIViewController?

  func build(data: ProductDetailsData) -> UIViewController {

    let worker = ProductDetailsWorker()

    let interactor = ProductDetailsInteractor(
      worker: worker
    )

    let presenter = ProductDetailsPresenter(
      viewEntityInitData: data,
      interactor: interactor,
      router: self
    )

    let viewController = ProductDetailsViewController(
      presenter: presenter
    )

    presenter.viewController = viewController
    interactor.presenter = presenter
    worker.interactor = interactor
    self.viewController = viewController

    return viewController

  }

}

// MARK: Methods of ProductDetailsPresenterToRouterProtocol

extension ProductDetailsRouter: ProductDetailsPresenterToRouterProtocol {
}
