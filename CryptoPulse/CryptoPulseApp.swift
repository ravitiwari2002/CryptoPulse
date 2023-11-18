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
    @State private var showLaunchView: Bool = true
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                NavigationView{
                    HomeView()
                        .navigationBarHidden(true)
                }
                .environmentObject(vm)
                ZStack{
                    if showLaunchView{
                        LaunchViewFile(showLaunchView: $showLaunchView)
                            .transition(.move(edge:.leading))
                    }
                }
                .zIndex(2.0)
                
            }
        }
    }
}
