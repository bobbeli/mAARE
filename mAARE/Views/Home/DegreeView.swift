//
//  DegreeView.swift
//  mAARE
//
//  Created by Dimitri Suter on 30.05.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI

struct DegreeView: View {
	@Binding var degreeModel: DegreeModel
	
	func getDecimalPart() -> String {
		let array = "\(degreeModel.temperature)".components(separatedBy: ".")
		let num = array[1];
		if (num.count > 1) {
			return num;
		} else {
			return "0\(num)"
		}
	}
	
	func getRealNumPart() -> String {
		let array = "\(degreeModel.temperature)".components(separatedBy: ".");
		return array[0];
	}
	
	var body: some View {
		HStack (alignment: .top) {
			VStack{
				Text(getRealNumPart())
					.offset()
					.font(.custom("mAare", size: 90))
			}.frame(height:100)
			VStack(alignment: .trailing) {
				Image("degree")
					.resizable()
					.frame(width: 27, height: 27, alignment: .leading)
				Spacer()
				Text(self.getDecimalPart())
					.font(.custom("mAare", size: 30))
			}.frame(height: 75)
				.padding(.top, 5)
		}
		.padding(.top, Screen.height * 0.1)
		.foregroundColor(Color.white)
	}
}

struct DegreeView_Previews: PreviewProvider {
	@State static var prevDegreeModel = DegreeModel(temperature: 13.04, imageName: "lobster", colorName: "normal", lastUpdate: Date())
	
	static var previews: some View {
		Group {
			DegreeView(degreeModel: $prevDegreeModel)
		}.previewLayout(.fixed(width: 500, height: 400))
			.background(Color.red)
	}
}
