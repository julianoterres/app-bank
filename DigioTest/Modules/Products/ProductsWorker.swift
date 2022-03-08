//
//  ProductsWorker.swift
//  DigioTest
//
//  Created by Juliano Terres on 03/03/22.
//

import Foundation

// MARK: Methods of ProductsWorkerProtocol

class ProductsWorker: ProductsWorkerProtocol {

  // MARK: Private Properties

  weak var interactor: ProductsWorkerToInteractorProtocol?
  private let productService: ProductServiceProtocol

  // MARK: Inicialization

  init(productService: ProductServiceProtocol) {
    self.productService = productService
  }

}

// MARK: Methods of ProductsInteractorToWorkerProtocol

extension ProductsWorker: ProductsInteractorToWorkerProtocol {

  func fetch() {
    productService.fetch { [weak self] result in
      switch result {
      case .success(let products):
        self?.interactor?.didFetchSuccess(products: products)
      case .failure:
        self?.interactor?.didFetchFailure()
      }
    }
  }

}
