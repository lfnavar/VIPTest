//
//  productStoreMem.swift
//  VIP test
//
//  Created by LFNAVAR on 2/20/19.
//  Copyright © 2019 LFNAVAR. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductStoreMem: ProductProtocol
{
    // MARK: - Data
    
    static var products = "[{\"id\": 359, \"stationName\": \"E 47 St & Park Ave\", \"latitude\": 40.75510267, \"longitude\": -73.97498696, \"availableBikes\": 47, \"statusValue\": \"In Service\" }, {\"id\": 377, \"stationName\": \"6 Ave & Canal St\", \"latitude\": 40.72243797, \"longitude\": -74.00566443, \"availableBikes\": 7, \"statusValue\": \"In Service\"}]"
    var productJson = Mapper<Products>().mapArray(JSONString: products)

    // MARK: - CRUD operations - Inner closure

    func fetchProducts(completionHandler: @escaping ([Products]) -> Void)
    {
        completionHandler(productJson!)
    }
}
