//
//  PersistCoinImages.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/8/23.
//

import Foundation
import SwiftUI

class PersistCoinImages {
    
    static let instance = PersistCoinImages()
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        createFolderIfNeeded(folderName: folderName)
        
        guard let data = image.pngData(), let url = getImageURL(imageName: imageName, folderName: folderName) else {
            return
        }
        
        do {
            try data.write(to: url)
        } catch {
            print("Unable to save image: \(error)")
        }
    }

    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getImageURL(imageName: imageName, folderName: folderName), FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }

    private func createFolderIfNeeded(folderName: String) {
        guard let url = getFolderPath(folderName: folderName), !FileManager.default.fileExists(atPath: url.path) else {
            return
        }

        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Image Folder not created: \(error)")
        }
    }

    private func getFolderPath(folderName: String) -> URL? {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(folderName)
    }

    private func getImageURL(imageName: String, folderName: String) -> URL? {
        getFolderPath(folderName: folderName)?.appendingPathComponent(imageName + ".png")
    }
}

