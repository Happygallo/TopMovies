//
//  TopMoviesEntity.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 27/07/24.
//

import Foundation

struct TopMoviesEntity: Decodable {
    let movies: [MovieEntity]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
