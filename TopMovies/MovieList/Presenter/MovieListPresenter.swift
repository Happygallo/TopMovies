//
//  MovieListPresenter.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 27/07/24.
//

import UIKit

class MovieListPresenter {
    
    var router: MovieListRouterProtocol?
    var interactorInput: MovieListInteractorInputProtocol?
    weak var presenterOutput: MovieListPresenterOutputProtocol?
    
    private var isFetchingMovies: Bool
    private var movies: [MovieListViewModel]
    private var mapper: MovieViewModelMapperProtocol
    
    init(mapper: MovieViewModelMapperProtocol) {
        self.movies = []
        self.mapper = mapper
        self.isFetchingMovies = false
    }
}

extension MovieListPresenter: MovieListPresenterInputProtocol {
    
    func fetchMovies() {
        guard !isFetchingMovies else { return }
        isFetchingMovies = true
        interactorInput?.fetchTopMovies()
    }
    
    func loadImage(index: Int) {
        let coverURL = movies[index].coverImageURL
        interactorInput?.loadImage(url: coverURL)
    }
    
    func movieTapped(index: Int) {
        guard let movie = interactorInput?.getMovie(id: movies[index].id) else {
            showError()
            return
        }
        router?.navigateToDetail(movie: movie)
    }
    
    func isLastMovie(at index: Int) -> Bool {
        index == movies.count - 1
    }
    
    func numberOfMovies() -> Int {
        movies.count
    }
    
    func movie(at index: Int) -> MovieListViewModel? {
        movies[index]
    }
}

extension MovieListPresenter: MovieListInteractorOutputProtocol {
    func fetchedTopMovies(_ models: [MovieEntity]) {
        let viewModels = mapper.map(entities: models)
        movies.append(contentsOf: viewModels)
        presenterOutput?.reloadData()
        isFetchingMovies = false
    }
    
    func showError() {
        router?.presentCustomAlert() { [weak self] in
            self?.isFetchingMovies = false
        }
    }
    
    func didLoadImage(_ data: Data, for url: URL) {
        if let image = UIImage(data: data) {
            self.updateMovieImage(image, for: url)
        }
    }
    
    private func updateMovieImage(_ image: UIImage, for url: URL) {
        if let index = movies.firstIndex(where: { $0.coverImageURL == url }) {
            var movie = self.movies[index]
            movie.coverImage = image
            self.movies[index] = movie
            self.presenterOutput?.reloadRow(index: index)
        }
    }
}
