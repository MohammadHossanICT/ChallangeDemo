//
//  FakeTrainRepository.swift
//  DemoWithLineTests
//
//  Created by M A Hossan on 23/10/2023.
//

import Foundation
@testable import DemoWithLine

class FakeTrainRepository: TrainRepository {

    func getList(for url: URL) async throws -> DemoWithLine.TflData {
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path =  bundle.url(forResource:url.absoluteString, withExtension: "json") else {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let lists = try decoder.decode([TflResponse].self, from: data )
            return lists
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
