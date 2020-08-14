//
//  ImageManager.swift
//  mAARE
//
//  Created by Dimitri Suter on 06.07.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import Foundation

class ImageManager: ObservableObject {
    @Published var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
