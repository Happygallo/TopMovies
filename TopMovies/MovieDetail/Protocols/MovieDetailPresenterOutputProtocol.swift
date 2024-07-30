//
//  MovieDetailPresenterOutputProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import Foundation

protocol MovieDetailPresenterOutputProtocol: AnyObject {
    func configureContent(model: MovieDetailViewModel)
}
