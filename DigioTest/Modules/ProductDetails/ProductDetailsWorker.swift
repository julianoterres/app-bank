//
//  ProductDetailsWorker.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import Foundation

// MARK: Methods of ProductDetailsWorkerProtocol

class ProductDetailsWorker: ProductDetailsWorkerProtocol {

  // MARK: Private Properties

  weak var interactor: ProductDetailsWorkerToInteractorProtocol?

  // MARK: Inicialization

  init() {}

}

// MARK: Methods of ProductDetailsInteractorToWorkerProtocol

extension ProductDetailsWorker: ProductDetailsInteractorToWorkerProtocol {
}
