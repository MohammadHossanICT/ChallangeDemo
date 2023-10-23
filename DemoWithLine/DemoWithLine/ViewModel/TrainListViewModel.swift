//
//  TrainListViewModel.swift
//  DemoWithLine
//
//  Created by M A Hossan on 20/10/2023.
//
import Foundation
import Combine

protocol TrainListViewModelAction: ObservableObject {
    func getTrainList(urlStr: String) async
}

@MainActor
final class TrainListViewModel {

    @Published private(set) var tflData: [TflResponse] = []
    @Published private(set) var customError: NetworkError?
    @Published private(set) var refreshing = true
    @Published var isErrorOccured = false

    private let repository: TrainRepository
    init(repository: TrainRepository) {
        self.repository = repository
    }
}
extension TrainListViewModel: TrainListViewModelAction {
    func getTrainList(urlStr: String) async {
        refreshing = true
        guard let url = URL(string: urlStr) else {
            self.customError = NetworkError.invalidURL
            refreshing = false
            isErrorOccured = false
            return
        }
        do {
            let tflResponse = try await repository.getList(for: url)
            refreshing = false
            isErrorOccured = false
            tflData = tflResponse

        } catch {
            refreshing = false
            isErrorOccured = true
            customError = error as? NetworkError
        }
    }
}
