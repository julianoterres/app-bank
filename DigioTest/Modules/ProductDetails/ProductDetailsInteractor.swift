//
//  ProductDetailsInteractor.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import Foundation

// MARK: Methods of ProductDetailsInteractorProtocol

class ProductDetailsInteractor: ProductDetailsInteractorProtocol {

  // MARK: Private Properties

  weak var presenter: ProductDetailsInteractorToPresenterProtocol?
  private let worker: ProductDetailsInteractorToWorkerProtocol

  // MARK: Inicialization

  init(worker: ProductDetailsInteractorToWorkerProtocol) {
    self.worker = worker
  }

}

// MARK: Methods of ProductDetailsPresenterToInteractorProtocol

extension ProductDetailsInteractor: ProductDetailsPresenterToInteractorProtocol {
}

// MARK: Methods of ProductDetailsWorkerToInteractorProtocol

extension ProductDetailsInteractor: ProductDetailsWorkerToInteractorProtocol {
}
