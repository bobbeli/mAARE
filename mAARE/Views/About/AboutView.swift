//
//  AboutView.swift
//  mAARE
//
//  Created by Dimitri Suter on 30.05.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI
import MessageUI

struct AboutView: View {
	@Binding var degreeModel: DegreeModel;
	@State var result: Result<MFMailComposeResult, Error>? = nil
	@State var isShowingMailView = false
	let url = URL(string: "https://doctoryellow.com/maare/bernebeach@2x.png")!
	
	
	var body: some View {
		VStack {
			Group{
				Text("«mAARE»")
					.padding(.top, 100)
				Text("Made in Bern")
					.padding(.bottom)
				Text("© 2020 Büro Destruct Bern")
				Text("Design: Lopetz, Büro Destruct")
				Text("Font: BD Retrocentric")
				Text("Programming: Bataais & Dimitri")
					.padding(.bottom)
				Text("Hydrological data by BAFU")
				Text("Measured at Schönau")
					.padding(.bottom)
			}
			Spacer()
			Group {
				Text("Supported by")
			}
			AsyncImage(
				url: url,
				placeholder: Text("Loading ...")
				).scaledToFit()
				.frame(width: 160)
			Spacer()
			Group {
				if (MFMailComposeViewController.canSendMail()) {
					Button(
						action: {
							self.isShowingMailView.toggle()
					}) {
						Text("Want your logo here?").underline()
					}
				} else {
					Text("Can't send emails from this device")
				}
			}.sheet(isPresented: $isShowingMailView) {
				MailView(isShowing: self.$isShowingMailView, result: self.$result)
			}
			Spacer()
			Group {
				Text("v 1.6")
					.padding(.bottom, 20)
			}
		}.navigationBarHidden(true)
		.navigationBarTitle("")
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
		.foregroundColor(Color.white)
		.background(degreeModel.color.edgesIgnoringSafeArea(.all))
		
	}
}

struct AboutView_Previews: PreviewProvider {
	@State static var prevDegreeModel = DegreeModel(temperature: 13.24, imageName: "lobster", colorName: "normal", lastUpdate: Date());
	
	static var previews: some View {
		AboutView(degreeModel:
			$prevDegreeModel)
	}
}
