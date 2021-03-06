//
//  DetailProductInteractor.swift
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

// Protocol that received the request from the view controller
protocol DetailProductBusinessLogic
{
  func getProduct(request: DetailProduct.GetProduct.Request)
}

// Prptocol that received the data from the router in Product List scene
protocol DetailProductDataStore
{
  var products: Products? { get set }
}

class DetailProductInteractor: DetailProductBusinessLogic, DetailProductDataStore
{
  var products: Products?
  var presenter: DetailProductPresentationLogic?
  var worker: DetailProductWorker?
 
  
  // MARK: Sent the response with the data in the protocol DetailProductDataStore, this data is received from the router Product List
  
  func getProduct(request: DetailProduct.GetProduct.Request)
  {
    let response = DetailProduct.GetProduct.Response(products: products!)
    presenter?.presentProduct(response: response)
  }
}
