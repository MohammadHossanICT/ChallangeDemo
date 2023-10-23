//
//  TrainListView.swift
//  DemoWithLine
//
//  Created by M A Hossan on 20/10/2023.
//

import SwiftUI

struct TrainListView: View {
    
    @StateObject var viewModel = TrainListViewModel(repository: TrainRepositoryImplementation(networkManager: NetworkManager()))
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.customError != nil && !viewModel.refreshing {
                    alertView()
                } else {
                    if viewModel.refreshing {
                        progressView()
                    }
                    if viewModel.tflData.count > 0 && !viewModel.refreshing {
                        
                        List(viewModel.tflData) { train in
                            TrainCellView(tflResponse: train)
                        }.listStyle(.grouped)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    getToolBarView()
                }
            }
            .navigationTitle(Text("Tube Line List"))
        }.task {
            await getDataFromAPI()
        }
        .refreshable {
            await getDataFromAPI()
        }
    }
    
    func getDataFromAPI() async {
        await viewModel.getTrainList(urlStr: NetworkURL.trainUrl)
    }
    
    @ViewBuilder
    func getToolBarView() -> some View {
        Button {
            Task{
                await getDataFromAPI()
            }
        } label: {
            HStack {
                Image(systemName: "arrow.clockwise")
                    .padding(.all, 10.0)
            }.fixedSize()
        }
        .cornerRadius(5.0)
    }
    
    @ViewBuilder
    func progressView() -> some View {
        VStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .frame(height: 180)
                .overlay {
                    VStack {
                        ProgressView().padding(50)
                        Text("Please Wait Message").font(.headline)
                    }
                }
        }
    }
    
    @ViewBuilder
    func alertView() -> some View {
        Text("").alert(isPresented: $viewModel.isErrorOccured) {
            Alert(title: Text("General_Error"), message: Text(viewModel.customError?.localizedDescription ?? ""),dismissButton: .default(Text("Okay")))
        }
    }
}

struct TrainListView_Previews: PreviewProvider {
    static var previews: some View {
        TrainListView(viewModel: TrainListViewModel(repository: TrainRepositoryImplementation(networkManager: NetworkManager())))
    }
}
