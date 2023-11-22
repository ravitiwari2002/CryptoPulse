//
//  SettingsView.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/21/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    let defaultURL = URL(string: "https://ravitiwari2002.github.io/Portfolio/")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://ravitiwari2002.github.io/Portfolio/")!

    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                List {
                    aboutSection(title: "Crypto Pulse", image: "logo-transparent", description: "Crypto Pulse, designed by Ravi Tiwari, is a cutting edge cryptocurrency application that provides real-time market data and portfolio management features. Stay ahead of the curve with real-time market and manage your investments like a pro.")
                    aboutSection(title: "CoinGecko", image: "coingecko", description: "CoinGecko is a comprehensive cryptocurrency data platform that provides real-time and historical data on 6000+ cryptocurrencies. In the development of Crypto Pulse, CoinGecko APIs have been utilized to provide live data.")
                    applicationSection
                }
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("About")
            .navigationBarItems(leading:
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark").font(.headline)
                })
            )
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private func aboutSection(title: String, image: String, description: String) -> some View {
        Section(header: Text(title)) {
            VStack(alignment: .leading) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(description)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit \(title)", destination: title.lowercased() == "coingecko" ? coingeckoURL : personalURL)
        }
    }

    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        }
    }
}

