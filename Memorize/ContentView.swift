//
//  ContentView.swift
//  Memorize
//
//  Created by Khushneet Inder Singh on 27/11/21.
//

import SwiftUI

struct ContentView: View {
	static let vehicleList = ["🚌", "🚜", "🛵", "🛴", "🚕", "🏎", "🚑", "🛺", "🚲", "🚒", "🚍"]
	static let flagsList = ["🇦🇷", "🇧🇷", "🇨🇳", "🇬🇷", "🇮🇳", "🇲🇱", "🇲🇰", "🇵🇷", "🇦🇪", "🇪🇭", "🇵🇹", "🇧🇪"]
	static let sportsList = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🥊", "🎱", "🏓"]
	
	@State var emojis : [String] = ContentView.vehicleList
	
	var emojiCount: Int {
		emojis.count
	}
	var body: some View {
		VStack {
			Text("Memorize!").font(.largeTitle)
			Spacer()
			ScrollView {
				LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 300))]) {
					ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
						CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
					}
				}
			}
			Spacer()
			HStack {
				vehicles
				Spacer()
				flags
				Spacer()
				emoticons
			}
			.font(.largeTitle)
			.padding(.horizontal)
			Spacer()
		}
		.padding(.horizontal)
		.foregroundColor(.red)
	}
	
	var flags : some View {
		VStack {
			Button(action : {
				emojis = ContentView.flagsList
				emojis.shuffle()
			}, label : {
				Image(systemName:"flag")
			})
			Text("Flags").font(.body)
		}
	}
	
	var vehicles : some View {
		VStack {
			Button(action : {
				emojis = ContentView.vehicleList
				emojis.shuffle()
			}, label : {
				Image(systemName:"car")
			})
			Text("Vehicles").font(.body)
		}
	}
	
	var emoticons : some View {
		VStack {
			Button(action : {
				emojis = ContentView.sportsList
				emojis.shuffle()
			}, label : {
				Image(systemName:"sportscourt")
			})
			Text("Sports").font(.body)
		}
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
