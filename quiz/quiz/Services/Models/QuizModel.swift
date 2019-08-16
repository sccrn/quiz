//
//  Quiz.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-15.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation

struct QuizModel: Codable {
    let question: String
    let answer: [String]
}
