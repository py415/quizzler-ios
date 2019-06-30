//
//  Question.swift
//  Quizzler
//
//  Created by Philip Yu on 6/29/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    // Properties
    let questionText: String
    let answer: Bool
    
    init(text: String, correct: Bool) {
        
        questionText = text
        answer = correct
        
    }
    
}
