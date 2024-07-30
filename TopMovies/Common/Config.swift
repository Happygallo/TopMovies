//
//  Config.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 30/07/24.
//

import Foundation

struct Config {
    static func getAPIKey() -> String? {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
           let xml = FileManager.default.contents(atPath: path),
           let plist = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? [String: Any] {
            return plist["API_KEY"] as? String
        }
        return nil
    }
}
