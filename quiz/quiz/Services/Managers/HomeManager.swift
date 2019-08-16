//
//  HomeManager.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Alamofire

class HomeManager {
    private lazy var apiManager: APIManager = {
        let manager = APIManager()
        return manager
    }()
    
    func fetchJavaChallenge(_ completion:@escaping (Result<QuizModel>) -> Void) {
        apiManager.createRequest(route: API.home, completion: completion)
    }
}
