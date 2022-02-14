//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Khushneet Inder Singh on 27/11/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
	let game = EmojiMemoryGame()
	
	var body: some Scene {
		WindowGroup {
			ContentView(viewModel: game)
		}
	}
}
