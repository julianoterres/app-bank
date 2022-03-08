//
//  MainServiceError.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

enum NetworkError: Error {
  case invalidURL
  case invalidRequest
  case noData
  case networkError(Error)
}
