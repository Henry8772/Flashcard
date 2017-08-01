//
//  Flashcards.swift
//  Flashcard
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Student. All rights reserved.
//

import Foundation

class Flashcard {
    var questions : String
    
    var options : [String]
    var correctAnswers : String
    
    init(question : String, options : [String]){
        self.questions = question
        self.options = options
        
        self.correctAnswers = options[0]
    }
}

class CardCollection {
    
    
    public static var instance : CardCollection = CardCollection()
    
    public private(set) var cards : [Flashcard]
    
    public private(set) var currentIndex : Int
    
    public var currentCard : Flashcard {
        get {
            return cards[currentIndex]
        }
    }
    
    private init() {
        
        cards = [
            Flashcard(question : "Test Question", options: ["Is it true","Is it false"]),
            Flashcard(question : "Where's The United State", options: ["On the Earth","In the Universe","In the Milky Way","Solar System"]),
            Flashcard(question : "What's the official name of New York", options: ["City of New York","New York","New York City","York New"])
        ]
        
        currentIndex = 0
    }
    
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count) {
            currentIndex = 0
        }
    }
    
    public func checkAnswers(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswers
    }
}
