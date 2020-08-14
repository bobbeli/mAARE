//
//  ImageView.swift
//  mAARE
//
//  Created by Dimitri Suter on 06.07.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI

struct ImageView: View {
   @ObservedObject var imageManager:ImageManager
    @State var image:UIImage = UIImage()

    init(withURL url:String) {
        imageManager = ImageManager(urlString:url)
    }

    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height:100)
				}.onReceive($imageManager.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
