//
//  ProductDetailsViewController.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

// MARK: Methods of ProductDetailsViewController

class ProductDetailsViewController: UIViewController {

  // MARK: Components Properties

  // MARK: Private Properties

  private let presenter: ProductDetailsViewControllerToPresenterProtocol
  private let screen = ProductDetailsScreen()

  // MARK: Inicialization

  init(presenter: ProductDetailsViewControllerToPresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
  }

  override func loadView() {
    view = screen
  }

}

// MARK: Methods of UProductDetailsPresenterToViewControllerProtocol

extension ProductDetailsViewController: ProductDetailsPresenterToViewControllerProtocol {

  func setupTitle() {
    title = presenter.viewEntity.name
  }

  func setupDescription() {
    screen.descriptionLabel.text = presenter.viewEntity.description
  }

}
