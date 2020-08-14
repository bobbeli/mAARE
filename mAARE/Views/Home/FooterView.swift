//
//  FooterView.swift
//  mAARE
//
//  Created by Dimitri Suter on 30.05.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI

struct FooterView: View {
	var shopURL = "https://www.burodiscount.net/products?search=seabag";
	@Binding var showView: Bool;
	@Binding var degreeModel: DegreeModel;
	
	func getDate() -> String {
		let format = DateFormatter()
		format.dateStyle = .long
		format.timeStyle = .short
		format.locale = Locale(identifier: "de_CH")
		
		if degreeModel.lastUpdate != nil {
			return format.string(from: degreeModel.lastUpdate!)
		} else {
			return "no Internet"
		}
	}
	
	var body: some View {
		HStack(alignment:.bottom){
				Button(action: {
					self.showView = true;
				}) {
					Image("ico_info")
						.resizable()
						.frame(width: 20, height: 20, alignment: .bottomLeading)
				}
				.padding(.bottom, 3)
				Spacer()
				VStack {
					Text("Aare Bern in C°")
					Text(getDate())
				}
				.font(.system(size: 13))
				Spacer()
				Image("bd")
					.onTapGesture {
						if let url = URL(string: self.shopURL) {
							UIApplication.shared.open(url)
						}
				}
			.padding(.bottom, 3)
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
				.foregroundColor(Color.white)
	}
}

struct FooterView_Previews: PreviewProvider {
	@State static var showView: Bool = false
	@State static var prevDegreeModel = DegreeModel(temperature: 13.24, imageName: "lobster", colorName: "normal", lastUpdate: Date())
	
	static var previews: some View {
		Group {
			FooterView(showView: $showView, degreeModel: $prevDegreeModel)
				.previewLayout(.fixed(width: 375, height: 200))
				.background(Color.red)
			
		}
	}
}
