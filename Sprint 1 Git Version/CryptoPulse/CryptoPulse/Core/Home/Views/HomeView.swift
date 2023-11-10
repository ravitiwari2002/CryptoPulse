//
//  HomeView.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/6/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                homeHeader
                
                searchBarView(searchText: $vm.searchText)
                
                if vm.isSearching {
                    if !showPortfolio && !vm.allCoins.isEmpty { // Only show if there are results
                        columnTitles
                        allCoinsList.transition(.move(edge: .leading))
                    } else if !showPortfolio && vm.allCoins.isEmpty && vm.showNoResults {
                        Text("No Results Found")
                            .foregroundColor(Color.theme.accent)
                            .padding()
                    }
                } else {
                    columnTitles
                    
                    if !showPortfolio && !vm.allCoins.isEmpty {
                        allCoinsList.transition(.move(edge: .leading))
                    }
                }

                if showPortfolio {
                    portfolioCoinList.transition(.move(edge: .trailing))
                }

                Spacer(minLength: 0)
            }


        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView().navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView{
    
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .background(CircleButtonAnimationView(animate: $showPortfolio))
                .animation(nil, value: showPortfolio)
                
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180:0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false).listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true).listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        Group {
            if !vm.allCoins.isEmpty { // Only show if there are results
                HStack {
                    Text("Coin")
                    Spacer()
                    if showPortfolio {
                        Text("Holdings")
                    }

                    Text("Price")
                        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
                }
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .padding(.horizontal)
            }
        }
    }
}
