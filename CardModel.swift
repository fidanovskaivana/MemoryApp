//
//  CardModel.swift
//  Memory
//
//  Created by Ivana Fidanovska on 9/24/20.
//  Copyright © 2020 Fidanovska. All rights reserved.
//

import Foundation
class CardModel {
    
    var cards:[Card] = []
    
    
    //Get Cards
    //Declaring an array to store generated cards
    
    func getCards(withDifficulty int: Int){
        var generatedCardsArray = [Card]()
        
        //Random card
        for number in 1...int*6{
            //Creating the first card
            let cardOne = Card()
            cardOne.imageName = "m\(number)"
            generatedCardsArray.append(cardOne)
            
            //creating the second card
            let cardTwo = Card()
            cardTwo.imageName = "m\(number)"
            generatedCardsArray.append(cardTwo)
        }
        
        self.cards = generatedCardsArray
        
    }
        
        func getCards() {
            var generatedCardsArray = [Card]()
            
            for number in 1...12{
                
                let cardOne = Card()
                cardOne.imageName = "m\(number)"
                generatedCardsArray.append(cardOne)
                
                let cardTwo = Card()
                cardTwo.imageName = "m\(number)"
                generatedCardsArray.append(cardTwo)
                
            }
            
            self.cards = generatedCardsArray
        }
        
        func shuffleCards(){
            let i = 4
            for _ in 0 ..< cards.count * i{
                let card = cards.remove(at: Int(arc4random_uniform(UInt32(cards.count))))
                cards.insert(card, at: Int(arc4random_uniform(UInt32(cards.count))))
            }
        }

}
