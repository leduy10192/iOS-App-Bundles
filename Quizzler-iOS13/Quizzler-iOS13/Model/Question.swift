//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Duy Le on 1/10/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question
{
    let text : String
    let answer: [String]
    let correctAnswer : String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
