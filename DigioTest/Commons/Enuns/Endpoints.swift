//
//  Endpoints.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

enum Endpoints: String {

  var value: String {
    return "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox\(self.rawValue)"
  }

  case products = "/products"

}
