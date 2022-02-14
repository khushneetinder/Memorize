//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ksingh on 2/5/22.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
	static let emojis = ["🚌", "🚜", "🛵", "🛴", "🚕", "🏎", "🚑", "🛺", "🚲", "🚒", "🚍"]
	
	static func createMemoryGame() -> MemoryGame<String> {
		MemoryGame(numberOfPairOfCards: 3) { pairIndex in
			emojis[pairIndex]
		}
	}
	
	@Published private var model : MemoryGame<String> = createMemoryGame()

	var cards : Array<MemoryGame<String>.Card> {
		return model.cards
	}
	
	// MARK: - Intent(s)
	func choose(card: MemoryGame<String>.Card) {
		model.chooseCard(card)
	}
}
