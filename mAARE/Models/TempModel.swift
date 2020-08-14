//
//  TemperatureModel.swift
//  mAARE
//
//  Created by Dimitri Suter on 14.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import Foundation


class TempModel: ObservableObject {
	
	@Published var degree: DegreeModel?;
	
	init(apiModel: ApiTempModel) {
		
//		let imageName = self..getImageNameByTemp(apiModel.temperature);
//		let colorName = self.getColorNameByTemp(apiModel.temperature);
		
		self.degree = DegreeModel(temperature: apiModel.temperature, imageName: "lobster", colorName: "normal");
		
	}
//
//	static func getImageNameByTemp(_ temp: Double) -> String {
//		print(temp)
//		return "lobster";
//	}
//
//	static func getColorNameByTemp(_ temp: Double) -> String {
//		return "normals"
//	}
}
