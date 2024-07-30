//
//  MovieViewModel.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 27/07/24.
//

import UIKit

struct MovieListViewModel {
    let id: Int
    let title: String
    let year: String
    let rating: String
    let coverImageURL: URL
    var ratingColor: UIColor
    var ratingLabelColor: UIColor
    var coverImage: UIImage? = nil
}
