//
//  TrailerStyles.swift
//  CaptureRecorder
//
//  Created by queena zheng on 10/28/26.
//
import SwiftUI

// MARK: - App Colors

struct TrailerTheme {
    static let background = Color.black

    static let primaryText = Color(
        red: 0.96,
        green: 0.94,
        blue: 0.90
    )

    static let secondaryText = Color.white.opacity(0.65)

    static let cardBackground = Color.black.opacity(0.62)

    static let accent = Color(
        red: 0.85,
        green: 0.18,
        blue: 0.16
    )

    static let buttonBackground = Color(
        red: 0.96,
        green: 0.94,
        blue: 0.90
    )

    static let buttonText = Color.black
}


// MARK: - Main Title

struct TrailerTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(TrailerTheme.primaryText)
    }
}


// MARK: - Subtitle

struct TrailerSubtitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(TrailerTheme.secondaryText)
    }
}


// MARK: - Scene Card

struct SceneCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(TrailerTheme.cardBackground)
            .cornerRadius(16)
            .padding(.horizontal)
    }
}


// MARK: - Main Button

struct TrailerButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(TrailerTheme.buttonText)
            .padding()
            .frame(maxWidth: .infinity)
            .background(TrailerTheme.buttonBackground)
            .cornerRadius(16)
            .padding(.horizontal)
    }
}

// MARK: - Ready Card

struct ReadyCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(24)
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.45))
            .cornerRadius(20)
            .padding(.horizontal)
    }
}

// MARK: - Recording Status

struct RecordingStatusStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(TrailerTheme.accent)
            .padding(8)
            .background(Color.black.opacity(0.55))
            .cornerRadius(10)
    }
}
