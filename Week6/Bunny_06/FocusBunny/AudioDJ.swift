//
//  AudioDJ.swift
//  FocusBunny
//
//  Created by queena zheng on 9/30/26.
//
import AVFoundation

@Observable
class AudioDJ {
    var player: AVAudioPlayer? = nil

    init() {
        print("AudioDJ init")
    }

    func play() {
        player = loadBundleAudio("rain.mp3")
        player?.numberOfLoops = -1
        player?.play()
    }

    func stop() {
        player?.stop()
    }

    func loadBundleAudio(_ fileName: String) -> AVAudioPlayer? {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            return try AVAudioPlayer(contentsOf: url)
        } catch {
            print("loadBundleAudio error", error)
        }

        return nil
    }
}
