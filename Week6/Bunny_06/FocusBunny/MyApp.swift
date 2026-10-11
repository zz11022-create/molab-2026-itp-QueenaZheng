import SwiftUI

@main
struct MyApp: App {
    @State var audioDJ = AudioDJ()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(audioDJ)
        }
    }
}
