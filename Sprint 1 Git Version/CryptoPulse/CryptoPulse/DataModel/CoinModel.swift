//
//  CoinModel.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/6/23.
//

    /*
     URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
     
     JSON Response:
     
     {
        "id":"bitcoin",
        "symbol":"btc",
        "name":"Bitcoin",
        "image":"https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        "current_price":34943,
        "market_cap":682110414795,
        "market_cap_rank":1,
        "fully_diluted_valuation":733252845422,
        "total_volume":11154331626,
        "high_24h":35276,
        "low_24h":34779,
        "price_change_24h":-106.58135343601316,
        "price_change_percentage_24h":-0.30409,
        "market_cap_change_24h":-3676853964.2037354,
        "market_cap_change_percentage_24h":-0.53615,
        "circulating_supply":19535306.0,
        "total_supply":21000000.0,
        "max_supply":21000000.0,
        "ath":69045,
        "ath_change_percentage":-49.3431,
        "ath_date":"2021-11-10T14:24:11.849Z",
        "atl":67.81,
        "atl_change_percentage":51480.08202,
        "atl_date":"2013-07-06T00:00:00.000Z",
        "roi":null,
        "last_updated":"2023-11-07T01:34:43.679Z",
        "sparkline_in_7d":{
           "price":[
              34494.37986890222,
              34527.496353933864,
              34462.72614000576,
              34397.19430042551,
              34220.87837655487,
              34248.88133600439,
              34300.07522213647,
              34244.988540354476,
              34163.155409460735,
              34408.880298482785,
              34446.74011601751,
              34448.03724542942,
              34518.485187201186,
              34314.89989526099,
              34174.573423241025,
              34347.24118843922,
              34263.92304531344,
              34441.587044179745,
              34389.27729541464,
              34429.10789269401,
              34467.42498008609,
              34640.077352659755,
              34491.95654544809,
              34600.234530905356,
              34672.2892841885,
              34516.49879191784,
              34508.71665702418,
              34466.55986096471,
              34451.56056131886,
              34461.717660541966,
              34353.19007322061,
              34419.37640933752,
              34491.82577885444,
              34444.23890387487,
              34442.62781023508,
              34378.19777070461,
              34410.274863220664,
              34789.98287468904,
              34499.464374997864,
              34268.536156862094,
              34254.65392526724,
              34446.447220928996,
              34509.35835925907,
              34573.50053343686,
              34514.2530416425,
              35112.29258839147,
              35280.800709488845,
              35242.42251914622,
              35457.45491210553,
              35434.07873724717,
              35600.000808689074,
              35752.93847887172,
              35617.000690143446,
              35515.18705620018,
              35217.6402284022,
              35253.0462476304,
              35270.19926316301,
              35297.76324975522,
              35399.19078183917,
              35403.828222282034,
              35399.18011779708,
              35435.45990512407,
              35037.669832264175,
              34948.03597314879,
              34673.06992416179,
              34625.68511542296,
              34755.7351290754,
              34833.94133105937,
              34988.84055431659,
              34872.82764853984,
              34899.123011127216,
              34784.75682861825,
              34924.05545044328,
              34524.32701408232,
              34631.016444231194,
              34681.054082038994,
              34696.794805413774,
              34427.701317030136,
              34549.300522175436,
              34453.830542748234,
              34410.4564507455,
              34451.504010187586,
              34252.04240987654,
              34228.10466330463,
              34264.19186777787,
              34410.90808829954,
              34529.38146357617,
              34715.6377506607,
              34625.48474036619,
              34369.257069351144,
              34585.1200414841,
              34493.84536284748,
              34648.10977370759,
              34645.389378922286,
              34628.64860018296,
              34731.38136896784,
              34698.76697112267,
              34777.525736928,
              34704.67743145782,
              34726.441007178655,
              34681.19328716267,
              34691.57327810835,
              34824.237124685205,
              34795.28956819087,
              34856.20290105155,
              34781.29978271764,
              34766.693078879136,
              34704.16851755884,
              34764.37066237337,
              34718.049510689954,
              34766.97786322934,
              34715.15865701715,
              34714.66772934508,
              34759.94445675495,
              34776.86859251541,
              34751.900120677514,
              34770.2179112517,
              34818.00395057272,
              35082.47514376539,
              35077.87470723552,
              35010.61903732256,
              35046.85637982595,
              35072.83919850849,
              35285.45065247467,
              35194.72213302707,
              35180.420594792464,
              35082.73649136871,
              35204.89892757509,
              35060.41367130617,
              35157.354642345024,
              35151.33867485179,
              35100.90383413808,
              35129.988803108914,
              34869.83330961038,
              34930.56418423463,
              34913.58813936874,
              34980.264669869255,
              35097.769245574185,
              35064.39032505443,
              35017.05800556553,
              35027.36503342727,
              34650.28872962689,
              34948.9802272091,
              35061.92874919579,
              35070.71397661049,
              34914.069719978004,
              34925.149090411185,
              35013.82604350345,
              34885.85950698434,
              34817.723781789915,
              34894.990626984814,
              34914.514585205085,
              34920.62896551723,
              35073.04867938142,
              35181.98550127671,
              35223.49269149692,
              35180.95882145437,
              34995.174003523825,
              35181.47469852691,
              35086.43117402505,
              34988.15480415682,
              34972.32689825672,
              34986.43490159055,
              35095.087136138674,
              34981.20656919353,
              35017.227413515604,
              35139.54799649783
           ]
        },
        "price_change_percentage_24h_in_currency":-0.3040880907519148
     }
     
     */
    
import Foundation


struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
