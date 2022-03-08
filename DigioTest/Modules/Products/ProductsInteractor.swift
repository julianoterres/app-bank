//
//  ProductsInteractor.swift
//  DigioTest
//
//  Created by Juliano Terres on 03/03/22.
//

import Foundation

// MARK: Methods of ProductsInteractorProtocol

class ProductsInteractor: ProductsInteractorProtocol {

  // MARK: Private Properties

  weak var presenter: ProductsInteractorToPresenterProtocol?
  private let worker: ProductsInteractorToWorkerProtocol

  // MARK: Inicialization

  init(worker: ProductsInteractorToWorkerProtocol) {
    self.worker = worker
  }

}

// MARK: Methods of ProductsPresenterToInteractorProtocol

extension ProductsInteractor: ProductsPresenterToInteractorProtocol {

  func fetch() {
    worker.fetch()
  }

}

// MARK: Methods of ProductsWorkerToInteractorProtocol

extension ProductsInteractor: ProductsWorkerToInteractorProtocol {

  func didFetchSuccess(products: ProductListEntity) {
    presenter?.didFetchSuccess(products: products)
  }

  func didFetchFailure() {
    presenter?.didFetchFailure()
  }

}
