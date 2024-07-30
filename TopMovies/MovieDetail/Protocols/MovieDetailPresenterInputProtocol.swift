//
//  MovieDetailPresenterInputProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import Foundation

protocol MovieDetailPresenterInputProtocol: AnyObject {
    func fetchMovie()
    func loadImages(urls: [URL])
}
