//
//  TopMovieEntity.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 27/07/24.
//

import Foundation

struct MovieEntity: Decodable {
    var id: Int
    var title: String
    var overview: String
    var releaseDate: Date
    var posterPath: String
    var voteAverage: Double
    var backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
    }
}
