//
//  BubbleModel.swift
//  mAARE
//
//  Created by Dimitri Suter on 09.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import Foundation
import SwiftUI

class Screen {
	public static var halfWidth = UIScreen.main.bounds.size.width / 2;
	public static var height = UIScreen.main.bounds.size.height;
	public static var width = UIScreen.main.bounds.size.width
	
}

class BubbleModel: ObservableObject, Identifiable {
	var id = UUID();
	var x = CGFloat.random(in: Screen.halfWidth * -1 ... Screen.halfWidth);
	var y = CGFloat.random(in: 0...Screen.height);
	
	var leavingY = Screen.height;
	
	var dimension = CGFloat.random(in: 30 ..< 60)
	var opacity: Double = Double.random(in: 0.3 ..< 0.8);
	var scale = CGFloat(0)
	var stroke = CGFloat.random(in: 6 ..< 15)
	
	var color = Color.white;
	
	var leave: Bool = false;

}
