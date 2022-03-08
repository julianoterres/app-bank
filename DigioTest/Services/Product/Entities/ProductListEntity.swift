//
//  ProductListEntity.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

struct ProductListEntity: Codable {
  let spotlight: [ProductSpotlightEntity]
  let products: [ProductEntity]
  let cash: ProductCashEntity
}
