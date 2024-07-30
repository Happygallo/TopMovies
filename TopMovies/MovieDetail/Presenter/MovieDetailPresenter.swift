//
//  MovieDetailPresenter.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import UIKit

class MovieDetailPresenter {
    
    var router: MovieDetailRouterProtocol?
    var interactorInput: MovieDetailInteractorInputProtocol?
    weak var presenterOutput: MovieDetailPresenterOutputProtocol?
    
    private var movie: MovieDetailViewModel?
    private let mapper: MovieDetailViewModelMapper
    
    init(mapper: MovieDetailViewModelMapper) {
        self.mapper = mapper
    }
}

extension MovieDetailPresenter: MovieDetailPresenterInputProtocol {
    func fetchMovie() {
        interactorInput?.fetchMovie()
    }
    
    func loadImages(urls: [URL]) {
        interactorInput?.loadImages(urls: urls)
    }
}

extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {
    func didFetchMovie(movie: MovieEntity) {
        guard let viewModel = mapper.map(entity: movie) else {
            return
        }
        
        self.movie = viewModel
        presenterOutput?.configureContent(model: viewModel)
    }
    
    func didLoadImages(_ images: [URL: Data]) {
        guard let viewModel = movie else { return }
        for (url, data) in images {
            if let image = UIImage(data: data) {
                if url == viewModel.coverImageURL {
                    movie?.coverImage = image
                } else if url == viewModel.posterImageURL {
                    movie?.posterImage = image
                }
            }
        }
        presenterOutput?.configureContent(model: viewModel)
    }
}
