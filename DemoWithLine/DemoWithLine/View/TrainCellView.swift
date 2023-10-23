//
//  TrainCellView.swift
//  DemoWithLine
//
//  Created by M A Hossan on 20/10/2023.
//

import SwiftUI

struct TrainCellView: View {

    let tflResponse: TflResponse

    var body: some View {
        HStack {
            
            Rectangle().foregroundColor(Color.getTubeColor(tubeLineName: tflResponse.name))
                .frame(width: 10)

            VStack(alignment: .leading,spacing: 5) {
                Text((tflResponse.name))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .accessibilityLabel(Text("Tube Line Name \(tflResponse.name)"))

                Text((tflResponse.lineStatuses.first?.statusSeverityDescription ?? "--"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityLabel(Text("Tube Status \(tflResponse.lineStatuses.first?.statusSeverityDescription ?? "--"))"))

            }
        }
    }
}

struct TrainCellView_Previews: PreviewProvider {
    static var previews: some View {
        TrainListView()
    }
}
