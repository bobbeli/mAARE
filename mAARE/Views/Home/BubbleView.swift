//
//  BubbleView.swift
//  mAARE
//
//  Created by Dimitri Suter on 09.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI

struct BubbleView: View {
	@ObservedObject var bubble: BubbleModel;
	@State var opacityAnimation: Bool = false;
	@State var leavingAnimation = false
	
	private func delayText() {
		DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0 ..< 0.5)) {
					self.leavingAnimation = true
			}
	}
	
	var body: some View {
		ZStack {
			Circle()
				.stroke(lineWidth: bubble.stroke)
				.foregroundColor(bubble.color)
				.offset(x: bubble.x, y: self.leavingAnimation ? -500 :  bubble.y)
				.animation(self.leavingAnimation ? Animation.easeIn(duration: 9) : nil)
				.frame(width: bubble.dimension, height: bubble.dimension)
				.animation(nil)
				.opacity(self.opacityAnimation ? bubble.opacity : 0)
				.onAppear() {
					self.delayText();
					let baseAnimation = Animation.easeIn(duration: .random(in: 0.5 ..< 1.6))
					let e = baseAnimation.delay(.random(in: 0 ..< 1.5))
					return withAnimation(e) {
						self.opacityAnimation = true;
					}
			}
		}
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
		
	}
}

struct BubbleView_Previews: PreviewProvider {
	
	@State static var bubble = BubbleModel()
		
	static var previews: some View {
		BubbleView(bubble: bubble)
			.background(Color.gray)
	}
}

