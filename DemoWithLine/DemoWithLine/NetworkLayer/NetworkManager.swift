//
//  NetworkManager.swift
//  DemoWithLine
//
//  Created by M A Hossan on 20/10/2023.
//

import Foundation

struct NetworkManager {
    private let urlSession: Networking
    init(urlSession: Networking = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkManager: Fetchable {
    func get(url: URL) async throws -> Data {
        do {
            let (data, _) = try await urlSession.data(from: url)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
