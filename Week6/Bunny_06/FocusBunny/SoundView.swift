//
//  SoundView.swift
//  FocusBunny
//
//  Created by queena zheng on 9/30/26.
//
import SwiftUI

struct SoundView: View {
    @Environment(AudioDJ.self) var audioDJ

    var body: some View {
        VStack {
            Text("Focus Sounds")
                .font(.largeTitle)
                .padding()

            Text("🎧")
                .font(.system(size: 100))

            Text("Rain Sound")
                .padding()

            HStack {
                Button("Play") {
                    audioDJ.play()
                }

                Button("Stop") {
                    audioDJ.stop()
                }
            }

            Spacer()
        }
    }
}

#Preview {
    SoundView()
        .environment(AudioDJ())
}
