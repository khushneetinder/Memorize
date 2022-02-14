//
//  ContentView.swift
//  Memorize
//
//  Created by Khushneet Inder Singh on 27/11/21.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel : EmojiMemoryGame
	
	var emojiCount: Int {
		return viewModel.cards.count
	}
	
	var body: some View {
		ScrollView {
			LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 300))]) {
				ForEach(viewModel.cards) { item in
					CardView(card: item)
						.aspectRatio(2/3, contentMode: .fit)
						.onTapGesture {
							viewModel.choose(card: item)
						}
				}
			}
		}
		.padding(.horizontal)
		.foregroundColor(.red)
	}
}

struct CardView : View {
	let card : MemoryGame<String>.Card
	
	var body: some View {
		ZStack {
			let shape = RoundedRectangle(cornerRadius: 20)
			if card.isFaceUp {
				shape.fill().foregroundColor(.white)
				shape.strokeBorder(lineWidth: 3)
				Text(card.content).font(.largeTitle)
			}
			else if card.isMatched {
				shape.opacity(0)
			}
			else {
				shape.fill()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		let game = EmojiMemoryGame()
		ContentView(viewModel: game)
			.preferredColorScheme(.light)
		ContentView(viewModel: game)
			.preferredColorScheme(.dark)
	}
}
