//
//  MovieListPresenterInputProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 28/07/24.
//

import Foundation

protocol MovieListPresenterInputProtocol: AnyObject {
    
    var router: MovieListRouterProtocol? { get set }
    var interactorInput: MovieListInteractorInputProtocol? { get set }
    var presenterOutput: MovieListPresenterOutputProtocol? { get set }
    
    func fetchMovies()
    func loadImage(index: Int)
    func movieTapped(index: Int)
    func numberOfMovies() -> Int
    func isLastMovie(at index: Int) -> Bool
    func movie(at index: Int) -> MovieListViewModel?
}
