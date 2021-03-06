//
//  ProductModelModels.swift
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
import ObjectMapper

struct Products: Mappable
{
    var id: Int?
    var stationName: String?
    var latitude: Double?
    var longitude: Double?
    var availableBikes: Int?
    var statusValue: String?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        stationName <- map["stationName"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        availableBikes <- map["availableBikes"]
        statusValue <- map["statusValue"]
    }
}
