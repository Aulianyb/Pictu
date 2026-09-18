//
//  SoundManager.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 17/09/26.
//

import AVKit

class SoundManager {
    static let instance = SoundManager()
       var player: AVAudioPlayer?

       init() {
           do {
               try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
           } catch {
               print("Failed to set audio session category: \(error.localizedDescription)")
           }

           if #available(iOS 27.0, *) {
               AVAudioSession.sharedInstance().activate { activated, error in
                   if let error = error {
                       print("Failed to activate audio session: \(error.localizedDescription)")
                   }
               }
           } else {
               // Fallback on earlier versions
               print("get better devices man i dont know")
           }
       }

    func playSound(name : String) {
           guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
           do {
               player = try AVAudioPlayer(contentsOf: url)
               if (name == "FinalReveal") {
                   player?.volume = 0.2
               }
               player?.play()
           } catch {
               print("Error playing sound: \(error.localizedDescription)")
           }
       }
    
    func stopMusic() {
        player?.stop()
    }
}
