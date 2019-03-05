//
//  ProductsListViewController.swift
//  VIP test
//
//  Created by LFNAVAR on 2/20/19.
//  Copyright (c) 2019 LFNAVAR. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

// Protocol that you call from the presenter to show data in the view
protocol ProductsListDisplayLogic: class
{
    func displayProducts(viewModel: ProductsList.FetchProducts.ViewModel)
}

class ProductsListViewController: UITableViewController, ProductsListDisplayLogic
{
    // Interactor and routing variables
    var interactor: ProductsListBusinessLogic?
    var router: (NSObjectProtocol & ProductsListRoutingLogic & ProductsListDataPassing)?
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: Setup to connect all the classes
    
    private func setup()
    {
        // configure the VIP chain
        let viewController = self
        let interactor = ProductsListInteractor()
        let presenter = ProductsListPresenter()
        let router = ProductsListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.requestProducts()
    }
    
    // MARK: Fetch Products
    
    // ViewModel type array to handle the response of the API
    var displayedProducts: [ProductsList.FetchProducts.ViewModel.DisplayedProduct] = []
    
    // Function to send the request to the interactor through his protocol
    func requestProducts()
    {
        let request = ProductsList.FetchProducts.Request()
        interactor?.fetchProducts(request: request)
    }
    
    // Function that handle the data received from the presenter and later displayed in the table view
    func displayProducts(viewModel: ProductsList.FetchProducts.ViewModel)
    {
        displayedProducts = viewModel.displayedProducts
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return displayedProducts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let displayedProduct = displayedProducts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellProduct")
        
        if !displayedProduct.route {
            tableView.isUserInteractionEnabled = displayedProduct.route
        }
        cell?.textLabel?.text = displayedProduct.stationName
        cell?.detailTextLabel?.text = displayedProduct.statusValue
        return cell!
    }
}
