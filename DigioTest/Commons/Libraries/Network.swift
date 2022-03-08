//
//  NetworkProtocol.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

protocol NetworkProtocol {
  func request(request: URLRequest, complete: @escaping (Result<Data, NetworkError>) -> Void)
}

// MARK: Methods of Network

class Network {

  // MARK: Private Methods

  private func parseData(data: Data?,
                         response: URLResponse?,
                         complete: @escaping (Result<Data, NetworkError>) -> Void) {
    DispatchQueue.main.async {
      guard let data = data else {
        complete(.failure(.noData))
        return
      }
      let httpResponse = response as? HTTPURLResponse
      let statusCode = httpResponse?.statusCode ?? 500
      if statusCode != 200 && statusCode != 201 {
        complete(.failure(.invalidRequest))
        return
      }
      complete(.success(data))
    }
  }

}

// MARK: Methods of NetworkProtocol

extension Network: NetworkProtocol {

  func request(request: URLRequest, complete: @escaping (Result<Data, NetworkError>) -> Void) {
    URLSession.shared.dataTask(with: request) { [weak self] (data, response, _) in
      self?.parseData(data: data, response: response, complete: complete)
    }.resume()
  }

}
