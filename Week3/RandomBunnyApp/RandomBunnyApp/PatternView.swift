//
//  PatternView.swift
//  RandomBunnyApp
//
//  Created by queena zheng on 9/23/26.
//
import SwiftUI

struct PatternView: View {
    
    // Array of random elements
    let symbols = ["🐰", "🌸", "✨", "🥕"]
    
    // Store the random pattern
    @State private var pattern: [String] = []
    
    // Create 4 columns
    let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Random Bunny Pattern")
                .font(.title)
                .bold()
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(pattern.indices, id: \.self) { index in
                    Text(pattern[index])
                        .font(.system(size: 40))
                }
            }
            
            Button("Generate Again") {
                generatePattern()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            generatePattern()
        }
    }
    
    // Generate 16 random elements
    func generatePattern() {
        pattern = []
        
        for _ in 0..<16 {
            let randomIndex = Int.random(in: 0..<symbols.count)
            pattern.append(symbols[randomIndex])
        }
    }
}

#Preview {
    PatternView()
}
