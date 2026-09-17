//: Week02 - ASCII Bunny

import Foundation

// Load text file from Resources
func load(_ file: String) -> String {
    let path = Bundle.main.path(forResource: file, ofType: nil)
    let str = try? String(contentsOfFile: path!, encoding: .utf8)
    return str!
}

// Load the bunny
let bunny = load("bunny.txt")

// Split the bunny into separate lines
let bunnySplit = bunny.split(separator: "\n")

// Print three bunnies side by side
for line in bunnySplit {
    print("\(line)       \(line)       \(line)")
}
