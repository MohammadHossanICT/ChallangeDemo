//
//  NetworkingMock.swift
//  DemoWithLineTests
//
//  Created by M A Hossan on 23/10/2023.
//

import Foundation
@testable import DemoWithLine

class NetworkingMock: Networking {
    static var data: Data?

    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        guard let data = NetworkingMock.data else {
            throw NetworkError.dataNotFound
        }
        return (data, URLResponse())
    }
}
