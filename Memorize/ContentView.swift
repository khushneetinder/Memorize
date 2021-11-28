//
//  ContentView.swift
//  Memorize
//
//  Created by Khushneet Inder Singh on 27/11/21.
//

import SwiftUI

struct ContentView: View {
	let emojis = ["🚌", "🚜", "🛵", "🛴", "🚕", "🏎", "🚑", "🛺", "🚲", "🚒", "🚚", "🚖", "🚍"]
	@State var emojiCount = 4
	var body: some View {
		VStack {
			ScrollView {
				LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 300))]) {
					ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
						CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
					}
				}
			}
			Spacer()
			HStack {
				add
				Spacer()
				remove
			}
			.font(.largeTitle)
			.padding(.horizontal)
		}
		.padding(.horizontal)
		.foregroundColor(.red)
	}
	
	var add : some View {
		Button(action : {
			if (emojiCount < emojis.count) {
				emojiCount += 1
			}
		}, label : {
			Image(systemName:"plus.circle")
		}
		)
	}
	
	var remove : some View {
		Button(action : {
			if (emojiCount > 1) {
				emojiCount -= 1
			}
		}, label : {
			Image(systemName:"minus.circle")
		}
		)
	}
}

struct CardView : View {
	var content : String
	@State var isFaceUp : Bool = true
	
	var body: some View {
		ZStack {
			let shape = RoundedRectangle(cornerRadius: 20)
			if isFaceUp {
				shape.fill().foregroundColor(.white)
				shape.strokeBorder(lineWidth: 3)
				Text(content).font(.largeTitle)
			}
			else {
				shape.fill()
			}
		}
		.onTapGesture {
			isFaceUp = !isFaceUp
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.preferredColorScheme(.light)
		ContentView()
			.preferredColorScheme(.dark)
	}
}
