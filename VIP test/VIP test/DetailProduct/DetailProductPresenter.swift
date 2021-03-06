//
//  DetailProductPresenter.swift
//  VIP test
//
//  Created by LFNAVAR on 2/21/19.
//  Copyright (c) 2019 LFNAVAR. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailProductPresentationLogic
{
  func presentProduct(response: DetailProduct.GetProduct.Response)
}

class DetailProductPresenter: DetailProductPresentationLogic
{
  weak var viewController: DetailProductDisplayLogic?
  
  // MARK: Do all the logic to show the data in the view controller
  
  func presentProduct(response: DetailProduct.GetProduct.Response)
  {
    let product = response.products
    let displayedProduct = DetailProduct.GetProduct.ViewModel.DisplayedProduct(stationName: product.stationName!, latitude: product.latitude!, longitude: product.longitude!, availableBikes: product.availableBikes!, statusValue: product.statusValue!)
    let viewModel = DetailProduct.GetProduct.ViewModel(displayedProducts: displayedProduct)
    viewController?.displayProduct(viewModel: viewModel)
  }
}
