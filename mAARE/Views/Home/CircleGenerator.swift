//
//  CircleGenerator.swift
//  mAARE
//
//  Created by Dimitri Suter on 16.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import SwiftUI

struct CircleGenerator: View {
     @State var scale: CGFloat = 1

			 var body: some View {
					 ZStack {
							 ForEach((1...100)) { _ in
									 Circle()
											 .strokeBorder(Color(red: .random(in: 0...1),
																		 green: .random(in: 0...1),
																		 blue: .random(in: 0...1)),
															 lineWidth: .random(in: 1...20))
											 .blendMode(.colorDodge)
											 .animation(Animation.fluidSpring()
																	 .repeatForever()
																	 .speed(.random(in: 0.05...0.9))
																	 .delay(.random(in: 0...2))
											 )
											 .scaleEffect(self.scale * .random(in: 0.1...3))
											 .frame(width: .random(in: 20...100),
															height: CGFloat.random(in: 20...100),
															alignment: .center)
											 .position(CGPoint(x: .random(in: 0...1112),
																				 y: .random(in: 0...834)))
									 
							 }
							 }.onAppear {
									 self.scale = 1.2
							 }
					 .frame(width: 1112, height: 834, alignment: .center)
					 .drawingGroup(opaque: false, colorMode: .linear)
			 }
}

struct CircleGenerator_Previews: PreviewProvider {
    static var previews: some View {
        CircleGenerator()
    }
}
