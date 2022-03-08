//
//  UIView+AddConstraint.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

extension UIView {

  @discardableResult func addConstraint(
    attribute: NSLayoutConstraint.Attribute,
    alignElement: Any? = nil,
    alignElementAttribute: NSLayoutConstraint.Attribute = .notAnAttribute,
    constant: CGFloat,
    typeSize: NSLayoutConstraint.Relation = .equal
  ) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    let constraint = NSLayoutConstraint(
      item: self,
      attribute: attribute,
      relatedBy: typeSize,
      toItem: alignElement,
      attribute: alignElementAttribute,
      multiplier: 1,
      constant: (attribute == .right || attribute == .bottom) ? (constant * -1) : constant
    )
    constraint.isActive = true
    return constraint
  }

}
