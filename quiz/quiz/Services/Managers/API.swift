//
//  API.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-15.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import Alamofire

enum API: URLRequestConvertible {
    case home
    
    private var method: HTTPMethod {
        return .get
    }
    
    private var path: String {
        switch self {
        case .home: return Constants.Service.javaWords
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Service.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(Constants.Service.json, forHTTPHeaderField: Constants.Service.acceptType)
        urlRequest.setValue(Constants.Service.json, forHTTPHeaderField: Constants.Service.contentType)
        
        return urlRequest
    }
}
