//
//  ApiTempModel.swift
//  mAARE
//
//  Created by Dimitri Suter on 14.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import Foundation

class ApiTempModel: Codable {
	var date: String;
	var temperature: Double;
	var flow: Double;
	var height: Double;
	var temperature_text: String;
	var source: String;
	var timeformat: String;
	
	public func imageName() -> String {
		return "maare_normal";
	}
	
	public func getDate() -> Date {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return dateFormatter.date(from: self.date)!
	}
	
	public func colorName() -> String {
		var colorName = "gray"
		
		let decPart = self.getDecimalPart();
		let realPart = self.getRealPart();
		
		if (realPart<7) {
			colorName = "verycold";
		}
		else if (realPart>=7 && realPart<9) {
			colorName = "cold";
		}
		else if (realPart>=9 && realPart<11) {
			colorName = "cold-1";
		}
		else if (realPart>=11 && realPart<13) {
			colorName = "cold-2";
		}
		else if (realPart>=13 && realPart<15) {
			colorName = "underwater";
		}
		else if (realPart>=15 && realPart<17) {
			colorName = "hat";
		}
		else if (realPart == 17) {
			colorName = "neutral"
		}
		else if (realPart == 18) {
			colorName = "neutral-1"
		}
		else if (realPart == 19) {
			colorName = "normal-1";
		}
		else if (realPart == 20) {
			colorName = "hot";
		}
		else if (realPart == 21) {
			colorName = "veryhot";
		}
		else if (realPart > 21) {
			colorName = "veryhot-1";
		}
		// WeisserHAI Modus
		else if (decPart == 75 && realPart == 19) {
			colorName = "black"
		}
		
		if (realPart<15 && decPart >= 1 && decPart < 10) {
			colorName = "verycold";
		}
		
		return colorName
	}
	
	private func getDecimalPart() -> Int {
		let array = "\(self.temperature)".components(separatedBy: ".")
		return Int(array[1])!
	}
	
	private func getRealPart() -> Int {
		let array = "\(self.temperature)".components(separatedBy: ".")
		return Int(array[0])!
	}
}
