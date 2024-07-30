//
//  MovieDetailInteractorOutputProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import Foundation

protocol MovieDetailInteractorOutputProtocol: AnyObject {
    func didFetchMovie(movie: MovieEntity)
    func didLoadImages(_ images: [URL: Data])
}
