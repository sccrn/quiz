//
//  APIManager.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-15.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Alamofire

class APIManager {
    @discardableResult
    func createRequest<T:Decodable>(route: API, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void) -> DataRequest {
        return AF.request(route).responseDecodable (decoder: decoder) {
            (response: DataResponse<T>) in completion(response.result)
        }
    }
}
