import SwiftUI
import Combine

struct ContentView: View {
    @State var secondsRemaining = 30
    @State var isPlaying = false

    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Focus Bunny")
                    .font(.largeTitle)

                Text("🐰")
                    .font(.system(size: 100))

                Text("\(secondsRemaining)")
                    .font(.largeTitle)

                HStack {
                    Button("Start") {
                        isPlaying = true
                    }

                    Button("Pause") {
                        isPlaying = false
                    }

                    Button("Reset") {
                        secondsRemaining = 30
                        isPlaying = false
                    }
                }

                NavigationLink(destination: SoundView()) {
                    Text("Focus Sounds")
                        .padding()
                }
            }
            .padding()
            .onReceive(timer) { _ in
                if isPlaying {
                    if secondsRemaining > 0 {
                        secondsRemaining -= 1
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(AudioDJ())
}
