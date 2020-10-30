//
//  JsonResponseModel.swift
//  AboutCanada
//
//  Created by Raveendran on 22/10/20.
//  Copyright © 2020 com.ravi. All rights reserved.
//

import Foundation

//MARK: RESPONSE MODEL
struct CanadaInfo: Codable {
    var title: String?
    var rows: [rowData]
}

struct rowData: Codable {
    var title: String?
    var description: String?
    var imageHref: String?
}
