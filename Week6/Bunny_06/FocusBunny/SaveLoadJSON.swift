//
//  SaveLoadJSON.swift
//  FocusBunny
//
//  Created by queena zheng on 10/11/26.
//
import Foundation

func saveJSON<T: Encodable>(fileName: String, val: T) throws {
    let filePath = try documentPath(fileName: fileName)

    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    let jsonData = try encoder.encode(val)

    let str = String(data: jsonData, encoding: .utf8)!

    try str.write(
        to: filePath,
        atomically: true,
        encoding: .utf8
    )

    print("Saved JSON:", filePath)
}

func loadJSON<T: Decodable>(
    _ type: T.Type,
    fileName: String
) throws -> T {
    let filePath = try documentPath(fileName: fileName)

    let jsonData = try String(
        contentsOfFile: filePath.path
    ).data(using: .utf8)

    let decoder = JSONDecoder()

    return try decoder.decode(
        type,
        from: jsonData!
    )
}

func documentPath(fileName: String) throws -> URL {
    let directory = try FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: true
    )

    return directory.appendingPathComponent(fileName)
}
