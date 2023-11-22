//
//  MarketData.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/17/23.
//

import Foundation

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        return formattedValue(for: totalMarketCap, key: "usd")
    }
    
    var volume: String {
        return formattedValue(for: totalVolume, key: "usd")
    }
    
    var btcDominance: String {
        return formattedPercentage(for: marketCapPercentage, key: "btc")
    }
    
    private func formattedValue(for dict: [String: Double], key: String) -> String {
        return "$" + (dict[key]?.formattedWithAbbreviations() ?? "")
    }
    
    private func formattedPercentage(for dict: [String: Double], key: String) -> String {
        return dict[key]?.asPercentageString() ?? ""
    }
}



