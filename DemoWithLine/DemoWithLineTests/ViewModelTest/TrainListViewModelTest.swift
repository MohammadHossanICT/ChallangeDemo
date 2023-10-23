//
//  TrainListViewModel.swift
//  DemoWithLineTests
//
//  Created by M A Hossan on 23/10/2023.
//

import XCTest
@testable import DemoWithLine

final class TrainListViewModelTest: XCTestCase {

    var fakeTrainRepository: FakeTrainRepository!
    var  trainListViewModel: TrainListViewModel!

    @MainActor override func setUp() {
        fakeTrainRepository = FakeTrainRepository()
        trainListViewModel = TrainListViewModel(repository: fakeTrainRepository)
    }
    override func tearDown() {
        fakeTrainRepository = nil
        trainListViewModel = nil
    }

    // when url is correct, should have some data in Train Line List
    func test_getTrainList_when_url_is_correct() async {

        await trainListViewModel.getTrainList(urlStr: "tube")
        let trainList =  await trainListViewModel.tflData
        XCTAssertEqual(trainList.count, 11)
        let localError =  await trainListViewModel.customError
        XCTAssertNil(localError)
    }

    // when url is incorrect , it will return immediatly , No data in train array.
    func test_getTrainList_When_URL_isNotGiven() async {

        await trainListViewModel.getTrainList(urlStr: "")
        let trainList = await trainListViewModel.tflData
        XCTAssertEqual(trainList.count, 0)
        let localError = await trainListViewModel.customError
        XCTAssertEqual(localError, .invalidURL)
        XCTAssertNotNil(localError)

    }

    func testGetTrainList_When_APIFailure() async {
        
        XCTAssertNotNil(trainListViewModel)
        await trainListViewModel.getTrainList(urlStr: "faile")
        let trainList = await trainListViewModel.tflData
        XCTAssertEqual(trainList.count, 0)
        let localError = await trainListViewModel.customError
        XCTAssertNotNil(localError)
        XCTAssertEqual(localError, NetworkError.dataNotFound)

    }

    func testGetTrainList_When_URL_is_Incorrect() async {

        XCTAssertNotNil(trainListViewModel)
        await trainListViewModel.getTrainList(urlStr: "www.test.com")
        let trainList = await trainListViewModel.tflData
        XCTAssertEqual(trainList.count, 0)
        let localError = await trainListViewModel.customError
        XCTAssertNotNil(localError)
        XCTAssertEqual(localError, NetworkError.dataNotFound)
    }
}
