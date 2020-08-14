//
//  HomeView.swift
//  mAARE
//
//  Created by Dimitri Suter on 14.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI


struct HomeView: View {
	@State var imagePosition: CGPoint = CGPoint();
	@State var yOffset: CGFloat = CGFloat(0.0);
	@State var showSheetView = false;
	@State var scale: CGFloat = 1.0

	var footerHeight: CGFloat = 50.0;
	var degreeHeight: CGFloat = 100 + Screen.height * 0.15
	
	@ObservedObject var apiManager = APIManager.shared;
	@ObservedObject var bubbleManager = BubbleManager();
	
	func getAnimationHeight() -> CGFloat {
		var animationHeigt: CGFloat;
		switch Screen.height {
			case 896:
				animationHeigt = 160
			case 812:
				animationHeigt = 130
			case 736:
				animationHeigt = 70
			case 568:
				animationHeigt = 50
			default:
				animationHeigt = 70
		}
		return animationHeigt;
	}
	
	func getDeviceSpecificDuration() -> Double {
		var animationDuration: Double;
		switch Screen.height {
			case 896:
				animationDuration = 20
			case 812:
				animationDuration = 17
			case 736:
				animationDuration = 14
			case 568:
				animationDuration = 10
			default:
				animationDuration = 14
		}
		return animationDuration;
	}
	
	
	func getDeviceSpecificImageWidth() -> CGFloat {
		var imageWidth: CGFloat;
		switch Screen.height {
			case 896:
				imageWidth = 270
			case 812:
				imageWidth = 270
			case 736:
				imageWidth = 260
			case 568:
				imageWidth = 200
			default:
				imageWidth = 230
		}
		return imageWidth;
	}
	
	var body: some View {
		NavigationView {
			
			ZStack {
				
				VStack {
					BackgroundView(degreeModel: $apiManager.degreeModel)
				}.zIndex(0)
				
				VStack {
					BubblesView(bubbles: self.$bubbleManager.bubbles)
				}.zIndex(1)
				
				VStack {
					DegreeView(degreeModel: $apiManager.degreeModel)
					Image("maare_neutral")
						.resizable()
						.frame(width: self.getDeviceSpecificImageWidth(), height: getDeviceSpecificImageWidth(), alignment: .top)
						.offset(x: 0.0, y: self.yOffset)
						.scaleEffect(scale)
						.onTapGesture {
							SoundManager.playSounds(sound: self.apiManager.degreeModel.sound);
							self.bubbleManager.generate();
						}
					.onAppear {
						let baseAnimation = Animation.easeInOut(duration: self.getDeviceSpecificDuration())
						let repeated = baseAnimation.repeatForever(autoreverses: true)
						return withAnimation(repeated) {
							self.yOffset += self.getAnimationHeight()
						}
					}
					Spacer()
					FooterView(showView: self.$showSheetView, degreeModel: $apiManager.degreeModel)
						.frame(minWidth: 0, maxWidth: .infinity ,  minHeight: 30, maxHeight: self.footerHeight, alignment: .bottom)
						.edgesIgnoringSafeArea(.bottom)					
						.padding(.bottom, 27)
						.padding(.leading, 30)
						.padding(.trailing, 30)
				}
				Spacer()
			}
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
			.edgesIgnoringSafeArea(.all)
				.zIndex(2)
			
		}.sheet(isPresented: self.$showSheetView) {
			AboutView(degreeModel: self.$apiManager.degreeModel)
		}.alert(isPresented: $apiManager.hasNoInternet) {
			Alert(title: Text("Hello"), message: Text("Your Internet connection got lost. mAARE may not display the current river temperature."), dismissButton: .default(Text("OK")))
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	@State static var hasInternet = false;
	
	static var previews: some View {
		Group {
			HomeView().previewDevice(PreviewDevice(rawValue: "iPhone 7 Plus"))
				.previewDisplayName("iPhone XS Max")
			HomeView().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
				.previewDisplayName("iPhone SE")
			HomeView().previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
				.previewDisplayName("iPhone 11 Pro")
		}
		
	}
}


