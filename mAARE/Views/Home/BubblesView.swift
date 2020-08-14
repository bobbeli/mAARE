//
//  BubbleView.swift
//  mAARE
//
//  Created by Dimitri Suter on 09.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI

struct BubblesView: View {
	@Binding var bubbles : [BubbleModel];
	
	var body: some View {
		ZStack {
			ForEach(bubbles,id: \.id) { bubble in
				BubbleView(bubble: bubble)
			}
		}
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
	}
}

struct BubblesView_Previews: PreviewProvider {
	@State static var bubbles = [
		BubbleModel(),
		BubbleModel(),
		BubbleModel(),
		BubbleModel(),
		BubbleModel(),
		BubbleModel(),
		BubbleModel(),
	]
	static var previews: some View {
		BubblesView(bubbles: $bubbles)
			.background(Color.gray)
		
	}
}
