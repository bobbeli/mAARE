//
//  BubbleManager.swift
//  mAARE
//
//  Created by Dimitri Suter on 16.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import Foundation

class BubbleManager: ObservableObject {
	@Published var bubbles: [BubbleModel] = [];
	
	public func generate() {
		if (bubbles.count < 900) {
			let newBubbles = [
				BubbleModel(),
				BubbleModel(),
				BubbleModel(),
				BubbleModel(),
				BubbleModel(),
				BubbleModel(),
				BubbleModel(),
				BubbleModel()
			]
			self.bubbles.append(contentsOf: newBubbles)
		} else {
			self.bubbles.removeAll()
			
		}
	}
}
