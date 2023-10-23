//
//  TrainRepository.swift
//  DemoWithLine
//
//  Created by M A Hossan on 20/10/2023.
//

import Foundation
protocol TrainRepository {
    func getList(for url: URL) async throws -> TflData
}

struct TrainRepositoryImplementation {
    private let networkManager: Fetchable
    
    init(networkManager: Fetchable) {
        self.networkManager = networkManager
    }
}

extension TrainRepositoryImplementation: TrainRepository, JsonParser {
    func getList(for url: URL) async throws -> TflData {
        do {
            let listsData = try await networkManager.get(url: url)
            return try parse(data: listsData, type: TflData.self)
        } catch {
            throw error
        }
    }
}
