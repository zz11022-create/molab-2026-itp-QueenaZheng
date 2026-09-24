//
//  ContentView.swift
//  RandomBunnyApp
//
//  Created by queena zheng on 9/23/26.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Random Bunny App")
                    .font(.largeTitle)
                    .bold()

                Text("Create a random bunny pattern")
                    .font(.title3)

                NavigationLink("Generate Pattern") {
                    PatternView()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
