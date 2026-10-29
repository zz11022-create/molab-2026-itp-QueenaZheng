//

import SwiftUI
import AVFoundation
import Photos

struct ContentView: View {
  @State var model = Model()
  @State var isRecording = false
  @State var scene = 0
      
  var body: some View {
    ZStack {
      FrameView(image: model.previewImage)
        .edgesIgnoringSafeArea(.all)
        VStack(spacing: 16) {
            Text("Pet Trailer Studio")
                .modifier(TrailerTitleStyle())

            Text("Turn your pet into a three-act movie.")
                .modifier(TrailerSubtitleStyle())
            
            Text("Current Mood: \(model.selectedEffect.rawValue)")
                .foregroundColor(.white)
            
            if scene == 0 {
                VStack(spacing: 8) {
                    Text("READY FOR YOUR CLOSE-UP?")
                        .font(.title2)
                        .foregroundColor(.white)

                    Text("3 scenes. 1 tiny movie star.")
                        .foregroundColor(.white.opacity(0.7))
                }
                .modifier(ReadyCardStyle())
            }

            if scene == 1 {
                VStack {
                    Text("ACT 1 — INNOCENT")
                        .font(.title2)
                        .foregroundColor(.white)

                    Text("Everything seemed normal...")
                        .foregroundColor(.white)
                }
                .modifier(SceneCardStyle())
            }

            if scene == 2 {
                VStack {
                    Text("ACT 2 — CHAOS")
                        .font(.title2)
                        .foregroundColor(.white)

                    Text("Then everything went wrong.")
                        .foregroundColor(.white)
                }
                .modifier(SceneCardStyle())
            }
            
            if scene == 3 {
                VStack {
                    Text("ACT 3 — THE ESCAPE")
                        .font(.title2)
                        .foregroundColor(.white)

                    Text("And somehow... they got away.")
                        .foregroundColor(.white)
                }
                .modifier(SceneCardStyle())
            }
            
            if isRecording {
                Text("● REC")
                    .modifier(RecordingStatusStyle())
            }
            
            Button(
                scene == 0 ? "Start Trailer" :
                scene == 3 ? "Finish Trailer" :
                "Next Scene"
            ) {

                if scene == 0 {
                    scene = 1
                    model.changeEffect(to: .sepia)

                    model.startRecording()
                    isRecording = true
                }

                else if scene == 1 {
                    scene = 2
                    model.changeEffect(to: .pixellate)
                }

                else if scene == 2 {
                    scene = 3
                    model.changeEffect(to: .crystallize)
                }

                else if scene == 3 {
                    model.stopRecording()
                    isRecording = false

                    scene = 0
                    model.changeEffect(to: .normal)
                }
            }
            .modifier(TrailerButtonStyle())

            Spacer()

            FilterSelectionView()
            RecordButtonView()
        }
    }
    .onAppear {
      model.checkPermissions()
      model.setupSession()
    }
    .alert("Video saved", isPresented: $model.showingSavedAlert) {
    }
    .onChange(of: model.videoSaved) { _, saved in
      if saved {
        model.showingSavedAlert = true
        model.videoSaved = false
      }
    }
  }
  
  func FilterSelectionView() -> some View {
    // Effect selector
    return ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 5) {
        ForEach(VideoEffect.allCases, id: \.self) { effect in
          Button(action: {
            model.changeEffect(to: effect)
          }) {
            Text(effect.rawValue)
              .padding(8)
              .background(model.selectedEffect == effect ? Color.blue : Color.gray.opacity(0.7))
              .foregroundColor(.white)
              .cornerRadius(8)
          }
        }
      }
      .padding()
    }
    .background(Color.black.opacity(0.5))
  }

  func RecordButtonView() -> some View {
    return Button(action: {
      if isRecording {
        model.stopRecording()
      } else {
        model.startRecording()
      }
      isRecording.toggle()
    }) {
      Circle()
        .fill(isRecording ? Color.red : Color.white)
        .frame(width: 70, height: 70)
        .padding()
        .overlay(
          Circle()
            .stroke(Color.white, lineWidth: 2)
            .frame(width: 80, height: 80)
        )
    }
    .padding(.bottom, 5)
  }

}


#Preview {
  ContentView()
}
