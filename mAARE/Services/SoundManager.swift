//
//  SoundManager.swift
//  mAARE
//
//  Created by Dimitri Suter on 14.06.20.
//  Copyright © 2020 Dimitri Suter. All rights reserved.
//

import Foundation
import AVFoundation

enum SoundType {
	case walschrei, blubb, pflatsch, pflitsch, gruntz, aarnie, shark
}

class SoundManager {
	
	static var audioPlayer:AVAudioPlayer!
	
	static func playSounds(sound: SoundType) {
		
		let audioSession = AVAudioSession.sharedInstance()
		do {
			try audioSession.setCategory(AVAudioSession.Category.ambient)
			try audioSession.setActive(true)
		} catch {
			print("Failed to seta udio session category")
		}

		if let path = Bundle.main.path(forResource: self.getSoundFile(sound), ofType: nil){
			do{
				audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
				audioPlayer.prepareToPlay()
				audioPlayer.volume = 0.75;
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
					audioPlayer.play()
				}
			} catch {
				print("Error")
			}
		}
	}
	
	static func getSoundFile(_ soundfile: SoundType) -> String {
		return "0_walschrei.wav"
	}
}
