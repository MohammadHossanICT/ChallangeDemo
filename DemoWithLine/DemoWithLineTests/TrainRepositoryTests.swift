//
//  TrainRepositoryTests.swift
//  DemoWithLineTests
//
//  Created by M A Hossan on 23/10/2023.
//

import XCTest
@testable import DemoWithLine

final class TrainRepositoryTests: XCTestCase {

    var fakeNetworkManager: FakeNetworkManager!
    var trainRepository: TrainRepository!
    
    override func setUpWithError() throws {
        fakeNetworkManager = FakeNetworkManager()
        trainRepository = TrainRepositoryImplementation(networkManager: fakeNetworkManager)
    }
    override func tearDownWithError() throws {
        trainRepository = nil
    }

    // when passes train list array will return with some data
    func test_when_get_People_list_success() async {

        let lists = try? await trainRepository.getList(for: URL(string:"tube")!)
        XCTAssertNotNil(lists)
        XCTAssertEqual(lists?.count, 11)
        XCTAssertEqual(lists?.first?.name, "Bakerloo")
        XCTAssertEqual(lists?.first?.id, "bakerloo")

    }
    // when fails, train list will be nil
    func test_when_get_Train_list_fails() async throws {

        let lists = try? await trainRepository.getList(for: URL(string:"faile")!)
        XCTAssertNil(lists)
    }

    func test_when_get_Train_list_fails_urlIncorrect() async throws {

        do {
            let lists = try await trainRepository.getList(for: URL(string:"www.text.com")!)
            XCTAssertNil(lists)

        } catch {
            XCTAssertNotNil(error)
            XCTAssertEqual(error as! NetworkError, .dataNotFound)
        }
    }
}
