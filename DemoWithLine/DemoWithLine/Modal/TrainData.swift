//
//  TrainData.swift
//  DemoWithLine
//
//  Created by M A Hossan on 20/10/2023.
//

import Foundation

// MARK: - TflResponse
struct TflResponse: Codable, Identifiable {
    let id, name: String
    let lineStatuses: [LineStatus]

    enum CodingKeys: String, CodingKey {
        case id, name, lineStatuses
    }
}

// MARK: - LineStatus
struct LineStatus: Codable, Identifiable {

    let type: String
    let id, statusSeverity: Int
    let statusSeverityDescription, created: String

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case id, statusSeverity, statusSeverityDescription, created
    }
}

typealias TflData = [TflResponse]
