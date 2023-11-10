//
//  Color.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/6/23.
//

import Foundation
import SwiftUI

extension Color{
    
    static let theme = ColorTheme()
    
}

struct ColorTheme{
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
