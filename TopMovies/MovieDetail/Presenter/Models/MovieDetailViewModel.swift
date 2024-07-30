//
//  MovieDetailViewModel.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import UIKit

struct MovieDetailViewModel {
    let title: String
    let date: String
    let rating: String
    let coverImageURL: URL
    let posterImageURL: URL
    var description: String
    var ratingColor: UIColor
    var ratingLabelColor: UIColor
    var coverImage: UIImage? = nil
    var posterImage: UIImage? = nil
}
