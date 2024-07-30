//
//  MovieListRouterProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 28/07/24.
//

import UIKit

protocol MovieListRouterProtocol: MovieAlertProtocol {
    var viewController: UIViewController? { get set }
    static func show() -> UIViewController
    func navigateToDetail(movie: MovieEntity)
}
