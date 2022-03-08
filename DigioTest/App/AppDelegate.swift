//
//  AppDelegate.swift
//  DigioTest
//
//  Created by Juliano Terres on 03/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  // MARK: Pubic Variables

  var window: UIWindow?

  // MARK: Application

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    mainScreen()
    return true
  }

  // MARK: Private Methods

  private func mainScreen() {
    let mainScreen = UINavigationController(rootViewController: ProductsRouter().build())
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainScreen
    window?.makeKeyAndVisible()
  }

}
