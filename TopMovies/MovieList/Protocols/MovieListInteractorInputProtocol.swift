//
//  MovieListInteractorInputProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 28/07/24.
//

import Foundation

protocol MovieListInteractorInputProtocol: AnyObject {
    
    var interactorOutput: MovieListInteractorOutputProtocol? { get set }
    
    func fetchTopMovies()
    func loadImage(url: URL)
    func getMovie(id: Int) -> MovieEntity?
}
