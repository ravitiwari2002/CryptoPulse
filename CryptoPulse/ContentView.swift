//
//  ContentView.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()

            VStack(spacing: 40) {
                ForEach(ThemeColor.allCases, id: \.self) { color in
                    Text(color.rawValue + " Color")
                        .foregroundColor(color.color)
                        .font(.headline)
                }
            }
        }
    }
}

enum ThemeColor: String, CaseIterable {
    case accent = "Accent"
    case secondaryText = "Secondary Text"
    case red = "Red"
    case green = "Green"

    var color: Color {
        switch self {
        case .accent: return Color.theme.accent
        case .secondaryText: return Color.theme.secondaryText
        case .red: return Color.theme.red
        case .green: return Color.theme.green
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

