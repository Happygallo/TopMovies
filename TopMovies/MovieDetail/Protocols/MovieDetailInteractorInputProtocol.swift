//
//  MovieDetailInteractorInputProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import Foundation

protocol MovieDetailInteractorInputProtocol: AnyObject {
    func fetchMovie()
    func loadImages(urls: [URL])
}
