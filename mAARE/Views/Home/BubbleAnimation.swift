//
//  BubbleAnimation.swift
//  mAARE
//
//  Created by Dimitri Suter on 11.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI

struct BubbleAnimation: View {
	@Binding var bubble: BubbleModel;

	var body: some View {
		Circle()
			.opacity(0)
			.overlay(
				Circle()
					.stroke(bubble.getRandomColor(), lineWidth: 15)
					.position(bubble.circlePoint())
					.opacity(bubble.opacity)
					.onAppear {
						let baseAnimation = Animation.interactiveSpring()
						let repeated = baseAnimation.repeatForever(autoreverses: true)
						return withAnimation(repeated) {
							self.bubble.reCalcCirclePoint();
						}
				}
				
		)
			.animation(.easeInOut(duration: 1))
			.transition(.opacity)
			.frame(width: bubble.width, height: bubble.height)
	}
}

