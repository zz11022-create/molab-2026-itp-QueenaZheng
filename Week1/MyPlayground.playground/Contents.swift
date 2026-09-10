import Foundation

var width = 20
var height = 8

// Symbols used to create the random night sky
// Extra spaces make the pattern less crowded
var symbols = [" ", " ", " ", ".", "*", "+", "✧"]

// Generate one line of random symbols
func generateLine(width: Int, symbols: [String]) {
    var line = ""

    for _ in 0..<width {
        // Pick a random index from the symbols array
        let randomInt = Int.random(in: 0..<symbols.count)
        line += symbols[randomInt]
    }

    print(line)
}

// Generate the full text art by creating multiple lines
func generateSky(width: Int, height: Int, symbols: [String]) {
    for _ in 0..<height {
        generateLine(width: width, symbols: symbols)
    }
}

// Generate the random night sky
generateSky(width: width, height: height, symbols: symbols)
