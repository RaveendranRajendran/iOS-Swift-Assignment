//
//  NetworkManager.swift
//  AboutCanada
//
//  Created by Raveendran on 22/10/20.
//  Copyright © 2020 com.ravi. All rights reserved.
//

import Foundation

enum NetworkCalls {
    case getCountryInfo
}

extension NetworkCalls {
    //MARK: URL STRINGS
    public func url() -> URL {
        // Get the url from the constants.
        let urlStr = urlString.URL_STRING;
        return URL(string: urlStr)!
    }
    //MARK: REQUEST METHODS
    public var method: String {
            return "GET"
        }
    //MARK: API HEADERS
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

extension API {
    //MARK: All API request should pass through this function
    ///
    //MARK: - PARAMETERS:
    ///   - ROUTE: Enum type which contains URL,HTTP Method, HTTP Headers etc..
    ///   - BODY: Parameters to be passed to the API
    ///   - COMPLETION HANDLER: Will return the response from API
    class func apiRequest(route: NetworkCalls, body: [String: Any]?, completionHandler: @escaping(_ data: Data?, _ error: Error?) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        var urlRequest = URLRequest.init(url: route.url())
        urlRequest.httpMethod = route.method
        urlRequest.allHTTPHeaderFields = route.headers ?? [:]

        if let httpParameters = body {
            if let httpBody = try? JSONSerialization.data(withJSONObject: httpParameters, options: []) {
                urlRequest.httpBody = httpBody
            }
        }
        session.dataTask(with: urlRequest) { (data, response, error) in
            print(String(data: data ?? Data(), encoding: String.Encoding.utf8) ?? "")
            completionHandler(data, error)
            }.resume()

    }
}
