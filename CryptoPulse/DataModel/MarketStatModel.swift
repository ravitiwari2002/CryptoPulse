//
//  MarketStatModel.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/17/23.
//

import Foundation

struct MarketStatModel : Identifiable{
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
