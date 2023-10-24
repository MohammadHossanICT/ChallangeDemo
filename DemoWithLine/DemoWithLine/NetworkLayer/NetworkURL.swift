//
//  NetworkURL.swift
//  DemoWithLine
//
//  Created by M A Hossan on 20/10/2023.
//

import Foundation

struct NetworkURL {

    // Please add your add id and app key into info.plist file . 
    static let app_ID = (Bundle.main.infoDictionary?["APP_ID"] as? String ?? "")
    static let app_key = (Bundle.main.infoDictionary?["APP_KEY"] as? String ?? "")

    static let trainUrl = "https://api.tfl.gov.uk/Line/Mode/tube/Status?app_id=\(app_ID)&app_key=\(app_key)"

}
