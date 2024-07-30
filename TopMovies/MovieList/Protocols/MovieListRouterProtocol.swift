//
//  MovieListRouterProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 28/07/24.
//

import UIKit

protocol MovieListRouterProtocol {
    static func show() -> UIViewController
    func navigateToDetail(movie: MovieEntity)
}
