//
//  MovieListInteractorOutputProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 28/07/24.
//

import UIKit

protocol MovieListInteractorOutputProtocol: AnyObject {
    var interactorInput: MovieListInteractorInputProtocol? { get set }
    func didLoadImage(_ data: Data, for url: URL)
    func fetchedTopMovies(_ models: [MovieEntity])
    func showError()
}
