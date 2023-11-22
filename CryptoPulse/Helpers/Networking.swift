//
//  Networking.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/6/23.
//

import Foundation
import Combine

import Foundation
import Combine

class Networking {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url): return "[🔥] Bad response from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occurred"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { try handleURLResponse(output: $0, url: url) }
            .retry(2)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        if case let .failure(error) = completion {
            print(error.localizedDescription)
        }
    }
}
