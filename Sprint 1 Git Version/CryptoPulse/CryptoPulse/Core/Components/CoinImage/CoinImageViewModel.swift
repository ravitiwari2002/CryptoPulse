//
//  CoinImageViewModel.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/7/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject{
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    
    private let coin: CoinModel
    private var cancellable = Set <AnyCancellable>()
    private let dataService: CoinImageAPI
    
    init(coin: CoinModel){
        self.coin = coin
        self.dataService = CoinImageAPI(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers(){
        dataService.$image
            .sink{[weak self] (_) in self?.isLoading = false} receiveValue: { [weak self] (returnedImage) in self?.image = returnedImage
                
                
            }
            .store(in: &cancellable)
    }
}
