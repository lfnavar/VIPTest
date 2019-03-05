//
//  alamoFireStore.swift
//  VIP test
//
//  Created by LFNAVAR on 2/20/19.
//  Copyright © 2019 LFNAVAR. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

class AlamoFireStore: ProductProtocol {
    
    var URL_API = "https://feeds.citibikenyc.com/stations/stations.json"
    
    func fetchProducts(completionHandler: @escaping ([Products]) -> Void) {
        Alamofire.request(URL_API, method: .get).responseArray(keyPath: "stationBeanList") { (response: DataResponse<[Products]>) in
            if response.result.isSuccess {
                if let data = response.result.value {
                    completionHandler(data)
                } else {
                    completionHandler([])
                }
            } else  {
                completionHandler([])
            }
            
        }
        
        
    }
}
