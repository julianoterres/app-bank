//
//  String+Attributted.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

extension String {

  func attributedStringCustom(strings: [AttributedStringCustom]) -> NSAttributedString {
    let attributedString = NSMutableAttributedString(string: self)
    for string in strings {
      let range = (self as NSString).range(of: string.findString)

      if let color = string.color {
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
      }
      if let font = string.font {
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: range)
      }
      if let underline = string.underline {
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: underline.rawValue, range: range)
      }

    }
    return attributedString
  }

}
