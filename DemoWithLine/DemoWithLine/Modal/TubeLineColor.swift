//
//  TubeLineColor.swift
//  DemoWithLine
//
//  Created by M A Hossan on 23/10/2023.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }

    static func getTubeColor(tubeLineName: String) -> Color {
        
        switch tubeLineName {
        case "Bakerloo":
            return Color(hex: 0xB36305)
        case "Central":
            return Color(hex: 0xE32017)
        case "Circle":
            return Color(hex: 0xFFD300)
        case "District":
            return Color(hex: 0x00782A)
        case "Hammersmith & City":
            return Color(hex: 0xF3A9BB)
        case "Jubilee":
            return Color(hex: 0xA0A5A9)
        case "Metropolitan":
            return Color(hex: 0x9B0056)
        case "Northern":
            return Color(hex: 0x000000)
        case "Piccadilly":
            return Color(hex: 0x003688)
        case "Victoria":
            return Color(hex: 0x0098D4)
        case "Waterloo & City":
            return Color(hex: 0x95CDBA)
        default:
            return .clear
        }
    }
}
