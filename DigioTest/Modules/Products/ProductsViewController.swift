//
//  ProductsViewController.swift
//  DigioTest
//
//  Created by Juliano Terres on 03/03/22.
//

import UIKit

// MARK: Methods of ProductsViewController

class ProductsViewController: UIViewController {

  // MARK: Private Properties

  private let presenter: ProductsViewControllerToPresenterProtocol
  private let screen = ProductsScreen()

  // MARK: Inicialization

  init(presenter: ProductsViewControllerToPresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupElements()
    setupNavigation()
    presenter.viewDidLoad()
  }

  override func loadView() {
    view = screen
  }

  // MARK: Private Methods

  private func setupElements() {
    screen.errorView.delegate = self
    screen.collectionView.delegate = self
    screen.collectionView.dataSource = self
  }

  private func getCell(indexPath: IndexPath) -> UICollectionViewCell {
    switch presenter.viewEntity.products[indexPath.row] {
    case let data as ProductsSpotlightCellViewEntity:
      return getProductsSpotlightCell(data: data, indexPath: indexPath)
    case let data as ProductsCashCellViewEntity:
      return getProductsCashCell(data: data, indexPath: indexPath)
    case let data as ProductsCellViewEntity:
      return getProductsCell(data: data, indexPath: indexPath)
    default:
      return UICollectionViewCell()
    }
  }

  private func getProductsSpotlightCell(data: ProductsSpotlightCellViewEntity,
                                        indexPath: IndexPath) -> UICollectionViewCell {
    let cell: ProductsSpotlightCell = screen.collectionView.dequeueReusableCell(forIndexPath: indexPath)
    cell.data = data
    cell.delegate = self
    return cell
  }

  private func getProductsCashCell(data: ProductsCashCellViewEntity, indexPath: IndexPath) -> UICollectionViewCell {
    let cell: ProductsCashCell = screen.collectionView.dequeueReusableCell(forIndexPath: indexPath)
    cell.data = data
    cell.delegate = self
    return cell
  }

  private func getProductsCell(data: ProductsCellViewEntity, indexPath: IndexPath) -> UICollectionViewCell {
    let cell: ProductsCell = screen.collectionView.dequeueReusableCell(forIndexPath: indexPath)
    cell.data = data
    cell.delegate = self
    return cell
  }

}

// MARK: Methods of UProductsPresenterToViewControllerProtocol

extension ProductsViewController: ProductsPresenterToViewControllerProtocol {

  func showLoader() {
    screen.loaderView.startAnimating()
  }

  func hideLoader() {
    screen.loaderView.stopAnimating()
  }

  func showError(title: String, message: String) {
    screen.errorView.titleLabel.text = title
    screen.errorView.textLabel.text = message
    screen.errorView.isHidden = false
    screen.errorView.isUserInteractionEnabled = true
  }

  func hideError() {
    screen.errorView.isHidden = true
    screen.errorView.isUserInteractionEnabled = false
  }

  func showCollection() {
    screen.collectionView.isHidden = false
    screen.collectionView.isUserInteractionEnabled = true
  }

  func hideCollection() {
    screen.collectionView.isHidden = true
    screen.collectionView.isUserInteractionEnabled = false
  }

  func reloadData() {
    screen.collectionView.reloadData()
  }

  func setupUserName() {
    screen.userLoggedView.titleLabel.text = presenter.viewEntity.headerUser
  }

}

// MARK: Methods of ErrorViewDelegate

extension ProductsViewController: ErrorViewDelegate {

  func didTapButton() {
    presenter.didTapTryAgain()
  }

}

// MARK: Methods of UICollectionViewDelegate and UICollectionViewDataSource

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.viewEntity.products.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return getCell(indexPath: indexPath)
  }

}

// MARK: Methods of ProductsCashCellDelegate

extension ProductsViewController: ProductsCashCellDelegate {

  func didTapProductCash() {
    presenter.didTapProductCash()
  }

}

// MARK: Methods of ProductsSpotlightCellDelegate

extension ProductsViewController: ProductsSpotlightCellDelegate {

  func didTapProductSpotlight(indexPath: IndexPath) {
    presenter.didTapProductSpotlight(indexPath: indexPath)
  }

}

// MARK: Methods of ProductsCell

extension ProductsViewController: ProductsCellDelegate {

  func didTapProduct(indexPath: IndexPath) {
    presenter.didTapProduct(indexPath: indexPath)
  }

}
