//
//  MovieDetailInteractor.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import Foundation

class MovieDetailInteractor {
    
    var interactorOutput: MovieDetailInteractorOutputProtocol?
    
    private let movie: MovieEntity
    private let imageLoaderService: ImageLoaderService
    
    init(
        movie: MovieEntity,
        imageLoaderService: ImageLoaderService
    ) {
        self.movie = movie
        self.imageLoaderService = imageLoaderService
    }
}

extension MovieDetailInteractor: MovieDetailInteractorInputProtocol {
    func fetchMovie() {
        interactorOutput?.didFetchMovie(movie: movie)
    }
    
    func loadImages(urls: [URL]) {
        imageLoaderService.loadImages(from: urls) { [weak self] images in
            DispatchQueue.main.async {
                self?.interactorOutput?.didLoadImages(images)
            }
        }
    }
}
