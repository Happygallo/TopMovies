//
//  MovieListPresenterOutputProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 28/07/24.
//

import Foundation

protocol MovieListPresenterOutputProtocol: AnyObject {
    
    var presenterInput: MovieListPresenterInputProtocol? { get set }
    
    func reloadData()
    func reloadRow(index: Int)
}
