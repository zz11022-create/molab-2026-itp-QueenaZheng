import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var filterIntensity = 0.5
    @State private var showingFilters = false
    @State private var currentMood = "😇 Angel"

    let context = CIContext()

    var body: some View {
        VStack(spacing: 20) {
            Text("Pet Mood Studio")
                .font(.largeTitle)
            
            // Lets the user choose a photo from the photo library
            PhotosPicker(selection: $selectedItem) {
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 420)
                } else {
                    ContentUnavailableView(
                        "No picture",
                        systemImage: "photo.badge.plus",
                        description: Text("Tap to choose a pet photo")
                    )
                    .frame(height: 350)
                }
            }
            .buttonStyle(.plain)
            // Load and process a new image when the user selects one
            .onChange(of: selectedItem, loadImage)

            Text("Current Mood")
                .font(.title2)

            Text(currentMood)
                .font(.largeTitle)

            HStack {
                Text("Intensity")

                // Changes the strength of the current filter
                Slider(value: $filterIntensity)
                    .onChange(of: filterIntensity, applyProcessing)
            }

            HStack {
                Button("Choose Mood") {
                    showingFilters = true
                }
                .buttonStyle(.bordered)

                // Only show Share after an image has been selected
                if let processedImage {
                    ShareLink(
                        item: processedImage,
                        preview: SharePreview(
                            "Pet Mood Studio",
                            image: processedImage
                        )
                    )
                    .buttonStyle(.bordered)
                }
            }

            Spacer()
        }
        .padding()
        // Each mood is connected to a different Core Image filter
        .confirmationDialog(
            "How is your pet feeling today?",
            isPresented: $showingFilters
        ) {
            // Warm sepia effect
            Button("😇 Angel") {
                currentMood = "😇 Angel"
                setFilter(CIFilter.sepiaTone())
            }

            // Pixelated effect
            Button("😈 Chaos") {
                currentMood = "😈 Chaos"
                setFilter(CIFilter.pixellate())
            }

            // Soft blurred effect
            Button("😴 Sleepy") {
                currentMood = "😴 Sleepy"
                setFilter(CIFilter.gaussianBlur())
            }

            // Dark vignette around the image
            Button("👑 Royal") {
                currentMood = "👑 Royal"
                setFilter(CIFilter.vignette())
            }

            // Crystallized image effect
            Button("🌀 Weird") {
                currentMood = "🌀 Weird"
                setFilter(CIFilter.crystallize())
            }

            Button("Cancel", role: .cancel) { }
        }
    }

    // Loads the selected photo from PhotosPicker
    // and converts it into a Core Image image
    func loadImage() {
        Task {
            guard let imageData = try? await selectedItem?.loadTransferable(
                type: Data.self
            ) else {
                return
            }

            guard let inputImage = UIImage(data: imageData) else {
                return
            }

            let beginImage = CIImage(image: inputImage)

            currentFilter.setValue(
                beginImage,
                forKey: kCIInputImageKey
            )

            applyProcessing()
        }
    }

    // Changes the current Core Image filter
    // and processes the selected photo again
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }

    // Applies the current filter and intensity
    // then converts the result back into a SwiftUI Image
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(
                filterIntensity,
                forKey: kCIInputIntensityKey
            )
        }

        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(
                filterIntensity * 200,
                forKey: kCIInputRadiusKey
            )
        }

        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(
                filterIntensity * 200,
                forKey: kCIInputScaleKey
            )
        }

        guard let outputImage = currentFilter.outputImage else {
            return
        }

        guard let cgImage = context.createCGImage(
            outputImage,
            from: outputImage.extent
        ) else {
            return
        }

        let uiImage = UIImage(cgImage: cgImage)

        processedImage = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
