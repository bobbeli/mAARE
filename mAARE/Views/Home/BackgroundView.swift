//
//  BackgroundView.swift
//  mAARE
//
//  Created by Dimitri Suter on 02.08.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
	@Binding var degreeModel: DegreeModel

	var body: some View {
		Rectangle()
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
			.edgesIgnoringSafeArea(.all)
			.foregroundColor(degreeModel.color)
			.animation(Animation.easeIn(duration: 0.7))
	}
	
}
