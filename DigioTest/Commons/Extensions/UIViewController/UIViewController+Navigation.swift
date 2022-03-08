//
//  UIViewController+Navigation.swift
//  DigioTest
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

extension UIViewController {

  func setupNavigation() {
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    navigationController?.navigationBar.tintColor = .black
  }

}
