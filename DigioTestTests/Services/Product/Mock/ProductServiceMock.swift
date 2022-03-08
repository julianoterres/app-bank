//
//  ProductServiceMock.swift
//  DigioTestTests
//
//  Created by Juliano Terres on 08/03/22.
//

@testable import DigioTest

// MARK: Methods of ProductServiceProtocol

class ProductServiceMock: ProductServiceProtocol {

  var fetchResult: Result<ProductListEntity, NetworkError>!

  func fetch(completion: @escaping (Result<ProductListEntity, NetworkError>) -> Void) {
    completion(fetchResult)
  }

}

