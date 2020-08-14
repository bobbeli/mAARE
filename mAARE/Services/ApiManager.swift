//
//  ApiManager.swift
//  mAARE
//
//  Created by Dimitri Suter on 14.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//
import Alamofire
import Foundation
import Combine
import Network

class APIManager : ObservableObject {
	@Published var degreeModel: DegreeModel = DegreeModel(temperature: 0, imageName: "maare_neutral", colorName: "sleepy")
	@Published var loading = false
	@Published var hasNoInternet = false
	
	public static let shared: APIManager = APIManager();
	
	private var baseUrl: String;
	private var temperature: ApiTempModel?;
	
	let monitor = NWPathMonitor()


	private init() {
		self.baseUrl = "https://aare.schwumm.ch/";
		monitor.start(queue: .main)
	}
	
	public func checkConnection() {
		monitor.pathUpdateHandler = { path in
			if path.status == .satisfied {
				self.hasNoInternet = false;
			} else {
				self.hasNoInternet = true;
			}
		}
		self.loadTemp();
	}
	
	public func loadTemp() {
		self.loading = true;
		AF.request("\(baseUrl)/api/current", method: .get).response { response in
			switch response.result {
				case .success:
					if let res = response.data {
						self.temperature = try! JSONDecoder().decode(ApiTempModel.self, from: res);
						self.loading = false;
		
						if let model = self.temperature {
							self.degreeModel = DegreeModel(temperature: model.temperature, imageName: model.imageName(), colorName: model.colorName(), lastUpdate: model.getDate());
						}
						
					}
					break;
				case .failure:
					self.loading = false;
					print(response.error ?? "Failed loading Temperature");
					break;
			}
		}
	}
}
