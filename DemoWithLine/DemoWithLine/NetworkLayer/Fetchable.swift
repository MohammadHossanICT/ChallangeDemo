//
//  Fetchable.swift
//  DemoWithLine
//
//  Created by M A Hossan on 20/10/2023.
//

import Foundation

protocol Fetchable {
    func get(url: URL) async throws -> Data
}
