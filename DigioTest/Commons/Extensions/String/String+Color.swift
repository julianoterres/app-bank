//
//  String+Color.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

extension String {

  var convertToColor: UIColor {
    let hexadecimal = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    var rgbValue: UInt64 = 0
    Scanner(string: hexadecimal).scanHexInt64(&rgbValue)
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }

}
