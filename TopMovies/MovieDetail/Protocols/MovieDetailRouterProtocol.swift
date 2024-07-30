//
//  MovieDetailRouterProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import UIKit

protocol MovieDetailRouterProtocol {
    static func show(movie: MovieEntity) -> UIViewController
    func dismiss()
}
