//
//  CoinImageAPI.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/7/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageAPI {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = PersistCoinImages.instance
    private let folderName = "coin_images"
    private var imageName: String { coin.id }
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Got from local")
        } else {
            downloadCoinImage()
            print("Downloading Image")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = Networking.download(url: url)
            .tryMap { data in UIImage(data: data) }
            .sink(
                receiveCompletion: { completion in
                    Networking.handleCompletion(completion: completion)
                },
                receiveValue: { [weak self] downloadedImage in
                    guard let self = self, let image = downloadedImage else { return }
                    self.image = image
                    self.imageSubscription?.cancel()
                    self.fileManager.saveImage(image: image, imageName: self.imageName, folderName: self.folderName)
                }
            )
    }
}
