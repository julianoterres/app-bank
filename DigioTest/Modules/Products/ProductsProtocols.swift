//
//  ProductsProtocols.swift
//  DigioTest
//
//  Created by Juliano Terres on 03/03/22.
//

import UIKit

protocol ProductsScreenToViewControllerProtocol: AnyObject {
}

protocol ProductsViewControllerToPresenterProtocol: AnyObject {
  var viewEntity: ProductsViewEntity { get }
  func viewDidLoad()
  func didTapTryAgain()
  func didTapProductCash()
  func didTapProductSpotlight(indexPath: IndexPath)
  func didTapProduct(indexPath: IndexPath)
}

protocol ProductsPresenterProtocol: AnyObject {
  var viewController: ProductsPresenterToViewControllerProtocol? { get set }
}

protocol ProductsPresenterToInteractorProtocol: AnyObject {
  func fetch()
}

protocol ProductsPresenterToRouterProtocol: AnyObject {
  func presentProductDetails(data: ProductDetailsData)
}

protocol ProductsPresenterToViewControllerProtocol: AnyObject {
  func showLoader()
  func hideLoader()
  func showError(title: String, message: String)
  func hideError()
  func showCollection()
  func hideCollection()
  func reloadData()
  func setupUserName()
}

protocol ProductsInteractorProtocol: AnyObject {
  var presenter: ProductsInteractorToPresenterProtocol? { get set }
}

protocol ProductsInteractorToWorkerProtocol: AnyObject {
  func fetch()
}

protocol ProductsInteractorToPresenterProtocol: AnyObject {
  func didFetchSuccess(products: ProductListEntity)
  func didFetchFailure()
}

protocol ProductsWorkerProtocol: AnyObject {
  var interactor: ProductsWorkerToInteractorProtocol? { get set }
}

protocol ProductsWorkerToInteractorProtocol: AnyObject {
  func didFetchSuccess(products: ProductListEntity)
  func didFetchFailure()
}

protocol ProductsRouterProtocol: AnyObject {
  var viewController: UIViewController? { get set }
  func build() -> UIViewController
}
