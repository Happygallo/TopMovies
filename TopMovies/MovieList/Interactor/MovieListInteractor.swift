//
//  MovieListInteractor.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 27/07/24.
//

import Foundation

class MovieListInteractor {
    
    weak var interactorOutput: MovieListInteractorOutputProtocol?
    
    private var page: Int
    private var movies: [MovieEntity]
    private let apiDataManager: MovieListApiDataManagerProtocol
    private let imageLoaderService: ImageLoaderServiceProtocol
    
    init(
        apiDataManager: MovieListApiDataManagerProtocol,
        imageLoaderService: ImageLoaderServiceProtocol
    ) {
        page = 1
        movies = []
        self.apiDataManager = apiDataManager
        self.imageLoaderService = imageLoaderService
    }
}

extension MovieListInteractor: MovieListInteractorInputProtocol {
    func fetchTopMovies() {
        apiDataManager.fetchTopMovies(page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let topMovies):
                self.page += 1
                self.movies.append(contentsOf: topMovies.movies)
                self.interactorOutput?.fetchedTopMovies(topMovies.movies)
            case .failure(let error):
                self.interactorOutput?.fetchedError(error.localizedDescription)
            }
        }
    }
    
    func loadImage(url: URL) {
        imageLoaderService.loadImage(from: url) { [weak self] data in
            if let data {
                self?.interactorOutput?.didLoadImage(data, for: url)
            }
        }
    }
    
    func getMovie(id: Int) -> MovieEntity? {
        movies.first { $0.id == id }
    }
}
