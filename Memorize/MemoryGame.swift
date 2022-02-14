//
//  MemoryGame.swift
//  Memorize
//
//  Created by ksingh on 2/5/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
	private(set) var cards : Array<Card>
	private var indexOfFaceUpCard : Int?
	
	mutating func chooseCard(_ card: Card) {
		if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
			!cards[chosenIndex].isFaceUp,
			!cards[chosenIndex].isMatched {
			
			if let potentialIndex = indexOfFaceUpCard {
				if cards[chosenIndex].content == cards[potentialIndex].content {
					cards[chosenIndex].isMatched = true
					cards[potentialIndex].isMatched = true
				}
				indexOfFaceUpCard = nil
			}
			else {
				for index in cards.indices {
					cards[index].isFaceUp = false
				}
				indexOfFaceUpCard = chosenIndex
			}
			
			cards[chosenIndex].isFaceUp.toggle()
		}
	}
	
	init(numberOfPairOfCards: Int, createCardContent: (Int)->CardContent) {
		cards = Array<Card>()
	
		for pairIndex in 0..<numberOfPairOfCards {
			cards.append(Card(id: (pairIndex*2), content: createCardContent(pairIndex)))
			cards.append(Card(id: (pairIndex*2) + 1, content: createCardContent(pairIndex)))
		}
	}

	struct Card : Identifiable {
		var id: Int
		var isFaceUp : Bool = false
		var isMatched : Bool = false
		var content : CardContent
	}
}
