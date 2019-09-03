//
//  Constants.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-15.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation

struct Constants {
    struct Service {
        static let baseURL = "https://codechallenge.arctouch.com/quiz/"
        static let javaWords = "java-keywords"
        
        static let acceptType = "Accept"
        static let contentType = "Content-Type"
        static let json = "application/json"
    }
    
    struct Titles {
        static let reset = "Reset"
        static let start = "Start"
        static let congratulations = "Congratulations"
        static let timeFinished = "Time finished"
        static let tryAgain = "Try again"
        static let playAgain = "Play again"
    }
    
    struct Messages {
        static let congratsMessage = "Good job! You found all the answers on time. Keep up with the great work."
        static let timeFiniMessageOne = "Sorry, time is up! You got "
        static let timeFiniMessageTwo = " out of 50 answers."
    }
}
