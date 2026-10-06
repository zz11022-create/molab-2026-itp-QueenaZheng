import SwiftUI
import Combine

struct ContentView: View {
    @State var secondsRemaining = 30
    @State var isPlaying = false
    @AppStorage("focusSessions") var focusSessions: Int = 0

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
                    .onTapGesture {
                        secondsRemaining += 10
                    }
                Text("Tap on time to increase")
                    .foregroundColor(.gray)

                HStack {
                    Button("Start") {
                        isPlaying = true
                    }
                    .frame(width: 80, height: 40)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)

                    Button("Pause") {
                        isPlaying = false
                    }
                    .frame(width: 80, height: 40)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)

                    Button("Reset") {
                        secondsRemaining = 30
                        isPlaying = false
                    }
                    .frame(width: 80, height: 40)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                }

                Text("Focus Sessions: \(focusSessions)")
                    .font(.title2)

                HStack {
                    Button("+ Session") {
                        focusSessions += 1
                    }
                    .frame(width: 100, height: 40)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)

                    Button("- Session") {
                        focusSessions -= 1
                    }
                    .frame(width: 100, height: 40)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
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
