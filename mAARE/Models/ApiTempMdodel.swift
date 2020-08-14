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
		
		if (temperature<7) {
			return "maare_verycold";
		}
		else if (temperature>=7 && temperature<9) {
			return "maare_cold";
		}
		else if (temperature>=9 && temperature<11) {
			return "maare_cold";
		}
		else if (temperature>=11 && temperature<13) {
			return "maare_sleepy";
		}
		else if (temperature>=13 && temperature<15) {
			return "maare_underwater";
		}
		else if (temperature>=15 && temperature<17) {
			return "maare_normal";
		}
		else if (temperature==17) {
			return "maare_neutral"
		}
		else if (temperature==18) {
			return "maare_neutral"
		}
		else if (temperature==19) {
			return "maare_normal2";
		}
		else if (temperature==20) {
			return "maare_hot";
		}
		else if (temperature==21) {
			return "maare_veryhot";
		}
		else if (temperature>21) {
			return "maare_veryhot";
		}
		return "walrus"
	}
	
	public func getDate() -> Date {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		let date = dateFormatter.date(from: self.date)!
		return date;
	}
	
	public func colorName() -> String {
		if (temperature<7) {
			return "verycold";
		}
		else if (temperature>=7 && temperature<9) {
			return "cold";
		}
		else if (temperature>=9 && temperature<11) {
			return "cold-1";
		}
		else if (temperature>=11 && temperature<13) {
			return "neutral-1";
		}
		else if (temperature>=13 && temperature<15) {
			return "neutral";
		}
		else if (temperature>=15 && temperature<17) {
			return "underwater";
		}
		else if (temperature==17) {
			return "sleepy"
		}
		else if (temperature==18) {
			return "normal"
		}
		else if (temperature==19) {
			return "normal-1";
		}
		else if (temperature==20) {
			return "hot";
		}
		else if (temperature==21) {
			return "veryhot-1";
		}
		else if (temperature>21) {
			return "veryhot";
		}
		return "gray";
	}
}

//if (temperature<7) {
//		self.view.backgroundColor = UIColorFromRGB(0xA4B9DF);
//		[wal setImage:[UIImage imageNamed:@"maare_verycold"] forState:UIControlStateNormal];
//}
//else if (temperature>=7 && temperature<9) {
//		self.view.backgroundColor = UIColorFromRGB(0x819ED3);
//		[wal setImage:[UIImage imageNamed:@"maare_cold"] forState:UIControlStateNormal];
//}
//else if (temperature>=9 && temperature<11) {
//		self.view.backgroundColor = UIColorFromRGB(0x5281B5);
//		[wal setImage:[UIImage imageNamed:@"maare_cold"] forState:UIControlStateNormal];
//}
//else if (temperature>=11 && temperature<13) {
//		self.view.backgroundColor = UIColorFromRGB(0x3B689A);
//		[wal setImage:[UIImage imageNamed:@"maare_sleepy"] forState:UIControlStateNormal];
//}
//else if (temperature>=13 && temperature<15) {
//		self.view.backgroundColor = UIColorFromRGB(0x2F90C7);
//		[wal setImage:[UIImage imageNamed:@"maare_underwater"] forState:UIControlStateNormal];
//}
//else if (temperature>=15 && temperature<17) {
//		self.view.backgroundColor = UIColorFromRGB(0x25A3C3);
//		[wal setImage:[UIImage imageNamed:@"maare_normal"] forState:UIControlStateNormal];
//}
//else if (temperature==17) {
//		self.view.backgroundColor = UIColorFromRGB(0x1DCBC1);
//		[wal setImage:[UIImage imageNamed:@"maare_neutral"] forState:UIControlStateNormal];
//}
//else if (temperature==18) {
//		self.view.backgroundColor = UIColorFromRGB(0xEDB800);
//		[wal setImage:[UIImage imageNamed:@"maare_neutral"] forState:UIControlStateNormal];
//}
//else if (temperature==19) {
//		self.view.backgroundColor = UIColorFromRGB(0xFF8003);
//		[wal setImage:[UIImage imageNamed:@"maare_normal2"] forState:UIControlStateNormal];
//}
//else if (temperature==20) {
//		self.view.backgroundColor = UIColorFromRGB(0xD93312);
//		[wal setImage:[UIImage imageNamed:@"maare_hot"] forState:UIControlStateNormal];
//}
//else if (temperature==21) {
//		self.view.backgroundColor = UIColorFromRGB(0xEF73D4);
//		[wal setImage:[UIImage imageNamed:@"maare_veryhot"] forState:UIControlStateNormal];
//}
//else if (temperature>21) {
//		self.view.backgroundColor = UIColorFromRGB(0xB52495);
//		[wal setImage:[UIImage imageNamed:@"maare_veryhot"] forState:UIControlStateNormal];
//}

// {"date":"2020-06-14 13:30:00","temperature":14.93,"flow":132.99,"height":502.27,"temperature_text":"cold","source":"BAFU","timeformat":"local"}
