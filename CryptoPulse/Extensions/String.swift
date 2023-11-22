//
//  String.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/20/23.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
