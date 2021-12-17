//
//  Question.swift
//  Quizzler
//
//  Created by Muhammed Emrullah Cirit on 15.12.2021.
//

import Foundation

struct Question {
    let text: String
    let answer: Array<String>
    let correctAnswer: String
    
    init(q: String, a: Array<String>, correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
        
    }
    
}
