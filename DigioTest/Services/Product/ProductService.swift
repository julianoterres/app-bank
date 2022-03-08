//
//  ProductService.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import Foundation

// MARK: Methods of ProductServiceProtocol

protocol ProductServiceProtocol {
  func fetch(completion: @escaping (Result<ProductListEntity, NetworkError>) -> Void)
}

// MARK: Methods of ProductService

class ProductService {

  // MARK: Properties

  private let network: NetworkProtocol

  // MARK: Life Cycle

  init(network: NetworkProtocol) {
    self.network = network
  }

}

// MARK: Methods of ProductServiceProtocol

extension ProductService: ProductServiceProtocol {

  func fetch(completion: @escaping (Result<ProductListEntity, NetworkError>) -> Void) {
    guard let url = URL(string: Endpoints.products.value) else {
      completion(.failure(.invalidURL))
      return
    }
    network.request(request: URLRequest(url: url)) { result in
      switch result {
      case .success(let data):
        guard let products = try? JSONDecoder().decode(ProductListEntity.self, from: data) else {
          completion(.failure(.noData))
          return
        }
        completion(.success(products))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }

}
