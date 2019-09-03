//
//  HomeManager.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Alamofire

protocol HomeManagerProtocol: class {
    func fetchJavaChallenge(_ completion:@escaping (Result<QuizModel>) -> Void)
}

class HomeManager: HomeManagerProtocol {
    private lazy var apiManager: APIManager = {
        let manager = APIManager()
        return manager
    }()
    
    static let shared = HomeManager()
    
    func fetchJavaChallenge(_ completion:@escaping (Result<QuizModel>) -> Void) {
        apiManager.createRequest(route: API.home, completion: completion)
    }
}
