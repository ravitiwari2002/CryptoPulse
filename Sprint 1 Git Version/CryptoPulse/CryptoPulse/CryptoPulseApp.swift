//
//  CryptoPulseApp.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/6/23.
//

import SwiftUI

@main
struct CryptoPulseApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
