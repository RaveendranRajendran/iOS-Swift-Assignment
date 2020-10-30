//
//  APIHandling.swift
//  AboutCanada
//
//  Created by Raveendran on 22/10/20.
//  Copyright © 2020 com.ravi. All rights reserved.
//

import Foundation
import UIKit

typealias RequestError = (_ error: String) -> Void

class API {
    //MARK: fetch Canda Country Information
    // - Parameters:
    //   - success: Completion handler with success response
    //  - failure: Completion handler with error description.
    class func fetchCountryData(success: @escaping (_ response: CanadaInfo) -> Void, failure : @escaping RequestError) {
        API.apiRequest(
            route: .getCountryInfo,
            body: nil) { (data, error) in
                if let apiError = error {
                    failure(apiError.localizedDescription)
                }
                if let apiResponse = data {
                    do {
                        let responseStrInISOLatin = String(data: apiResponse, encoding: String.Encoding.isoLatin1)
                        guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                            return
                        }
                        // Conver Json to Swift stuct
                        do {
                            let myStruct = try JSONDecoder().decode(CanadaInfo.self, from: modifiedDataInUTF8Format)
                            success(myStruct)
                        }
                        
                    } catch let error {
                            failure(error.localizedDescription)
                    }
                }
        }
    }
}
