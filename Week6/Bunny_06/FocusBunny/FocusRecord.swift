//
//  FocusRecord.swift
//  FocusBunny
//
//  Created by queena zheng on 10/11/26.
//
import Foundation

struct FocusRecord: Identifiable, Codable {
    var id = UUID()
    var seconds: Int
}
