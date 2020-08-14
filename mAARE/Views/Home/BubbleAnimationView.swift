//
//  BubbleAnimationView.swift
//  mAARE
//
//  Created by Dimitri Suter on 11.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI

struct BubbleAnimationView: View {
	@State private var showDetail = false
    @State var scale: CGFloat = 1
	@State var x: CGFloat = 80
	@State var y: CGFloat = 80


	var body: some View {
		VStack {
			Button(action: {
				withAnimation(.easeInOut(duration: 2)) {
					self.showDetail.toggle()
				}
			}) {
				Image(systemName: "chevron.right.circle")
					.imageScale(.large)
					//					.rotationEffect(.degrees(showDetail ? 180 : 0))
					.scaleEffect(showDetail ? 3 : 1)
					.padding()
				//					.animation(.easeInOut(duration: 4))
				
				
			}
			Circle()
				.opacity(0)
				.overlay(
					Circle()
						.stroke(Color("sleepy"), lineWidth: 15)
						.scaleEffect(self.scale)
						.position(x: self.x, y: self.y)
						.onAppear {
							let baseAnimation = Animation.easeInOut(duration: 3)
							let repeated = baseAnimation.repeatForever(autoreverses: true).delay(0.9)
							
							return withAnimation(repeated) {
								self.x = 80
								self.y = 30
								self.scale = 1.1
							}
					}
					
					
			)
				
				.frame(width: 50, height: 50)
			Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
		}.foregroundColor(Color.yellow)
	}
	
}

struct BubbleAnimationView_Previews: PreviewProvider {
	static var previews: some View {
		BubbleAnimationView()
	}
}




