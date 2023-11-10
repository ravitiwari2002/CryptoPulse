//
//  HomeViewModel.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/6/23.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject{
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var showNoResults: Bool = false
    @Published var isSearching: Bool = false

    private let dataService = CryptoService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .receive(on: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.isSearching = !searchText.isEmpty
            }
            .store(in: &cancellables)

        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
            .map { (text, startingCoins) -> ([CoinModel], Bool) in
                // Remove leading and trailing spaces, and ignore multiple spaces between words
                let cleanedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
                let words = cleanedText.split(separator: " ")
                let finalText = words.joined(separator: " ")

                guard !finalText.isEmpty else {
                    return (startingCoins, false)
                }

                let lowercasedText = finalText.lowercased()

                let filteredCoins = startingCoins.filter { (coin) -> Bool in
                    return coin.name.lowercased().contains(lowercasedText) ||
                           coin.symbol.lowercased().contains(lowercasedText) ||
                           coin.id.lowercased().contains(lowercasedText)
                }

                return (filteredCoins, filteredCoins.isEmpty)
            }
            .sink { [weak self] (returnedCoins, noResults) in
                self?.allCoins = returnedCoins
                self?.showNoResults = noResults && self?.isSearching == true
            }
            .store(in: &cancellables)
    }



}
