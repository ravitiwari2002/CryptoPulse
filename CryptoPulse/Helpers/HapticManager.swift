//
//  HapticManager.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/17/23.
//

import Foundation
import SwiftUI
import UIKit

class HapticManager {
    static let generator = UINotificationFeedbackGenerator()

    static func notification(type: UINotificationFeedbackGenerator.FeedbackType = .success) {
        generator.prepare()
        generator.notificationOccurred(type)
    }
}
