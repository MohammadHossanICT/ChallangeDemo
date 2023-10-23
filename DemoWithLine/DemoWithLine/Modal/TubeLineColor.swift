//
//  TubeLineColor.swift
//  DemoWithLine
//
//  Created by M A Hossan on 23/10/2023.
//

import Foundation
import SwiftUI

enum TubeLineColor: String, CaseIterable {
  /// Name of the tube line
  case Bakerloo
  case Central
  case Circle
  case District
  case Jubilee
  case Metropolitan
  case Northern
  case Piccadilly
  case Victoria
 // case Waterloo & City

  var name: String {
    self.rawValue
  }
}

extension View {
    func getTubeColor(_ color: String) -> some View {

        switch color {
        case "Bakerloo": return self.foregroundColor(.brown)
        case "Central": return self.foregroundColor(.red)
        case "Circle": return self.foregroundColor(.yellow)
        case "District": return self.foregroundColor(.green)
        case "Jubilee": return self.foregroundColor(.gray)
        case "Metropolitan": return self.foregroundColor(.purple)
        case "Northern": return self.foregroundColor(.black)
        case "Piccadilly": return self.foregroundColor(.blue)
        case "Victoria": return self.foregroundColor(.secondary)

        default:
            return self.foregroundColor(.pink)
        }
    }
}
