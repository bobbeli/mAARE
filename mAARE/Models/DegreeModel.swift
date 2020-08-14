//
//  DegreeModel.swift
//  mAARE
//
//  Created by Dimitri Suter on 30.05.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import Foundation
import SwiftUI

class DegreeModel : Codable {
	public var temperature: Double;
	public var imageName: String;
	public var colorName: String;
	public var lastUpdate: Date?;

	init(temperature: Double, imageName: String, colorName: String, lastUpdate: Date? = nil) {
		self.temperature = temperature;
		self.imageName = imageName;
		self.colorName = colorName;
		self.lastUpdate = lastUpdate;
	}
	
}

extension DegreeModel {
	var sound: SoundType {
		
		let decPart = self.getDecimalPart();
		let realPart = self.getRealPart();
		
		if (decPart >= 20 && decPart < 30) {
			return .blubb
		}
		else if (decPart >= 50 && decPart < 60) {
			return .pflatsch
		}
		else if (decPart >= 80 && decPart < 90) {
			return .pflitsch
		}
		else if (decPart == 0) {
			return .aarnie
		}
		// WeisserHAI Modus
		else if (realPart == 19 && decPart == 75) {
			return .shark
		}
		if (realPart < 15 && decPart >= 1 && decPart < 10) {
			return .gruntz
		}
		
		return .walschrei
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

extension DegreeModel {
	var color: Color{
		ColorStore.shared.color(name: colorName)
	}
}

