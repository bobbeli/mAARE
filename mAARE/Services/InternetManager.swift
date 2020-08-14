//
//  InternetManager.swift
//  mAARE
//
//  Created by Dimitri Suter on 29.07.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//
import Foundation
import Network
import Combine

class InternetManager: ObservableObject {
	
	@Published var hasInternet = true;
	
	public static let shared: InternetManager = InternetManager();
	
	let monitor = NWPathMonitor()
	
	public func checkConnection() {
		monitor.pathUpdateHandler = { path in
			if path.status == .satisfied {
				self.hasInternet = true;
				print("We're connected!")
			} else {
				self.hasInternet = false;
				print("No connection.")
			}
		}
	}
}
