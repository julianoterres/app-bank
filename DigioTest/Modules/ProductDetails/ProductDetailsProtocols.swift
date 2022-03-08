//
//  ProductDetailsProtocols.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

protocol ProductDetailsScreenToViewControllerProtocol: AnyObject {
}

protocol ProductDetailsViewControllerToPresenterProtocol: AnyObject {
  var viewEntity: ProductDetailsViewEntity { get }
  func viewDidLoad()
}

protocol ProductDetailsPresenterProtocol: AnyObject {
  var viewController: ProductDetailsPresenterToViewControllerProtocol? { get set }
}

protocol ProductDetailsPresenterToInteractorProtocol: AnyObject {
}

protocol ProductDetailsPresenterToRouterProtocol: AnyObject {
}

protocol ProductDetailsPresenterToViewControllerProtocol: AnyObject {
  func setupTitle()
  func setupDescription()
}

protocol ProductDetailsInteractorProtocol: AnyObject {
  var presenter: ProductDetailsInteractorToPresenterProtocol? { get set }
}

protocol ProductDetailsInteractorToWorkerProtocol: AnyObject {
}

protocol ProductDetailsInteractorToPresenterProtocol: AnyObject {
}

protocol ProductDetailsWorkerProtocol: AnyObject {
  var interactor: ProductDetailsWorkerToInteractorProtocol? { get set }
}

protocol ProductDetailsWorkerToInteractorProtocol: AnyObject {
}

protocol ProductDetailsRouterProtocol: AnyObject {
  var viewController: UIViewController? { get set }
  func build(data: ProductDetailsData) -> UIViewController
}
