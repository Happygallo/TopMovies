//
//  APIDataManagerProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 28/07/24.
//

import Foundation

protocol MovieListApiDataManagerProtocol: AnyObject {
    func fetchTopMovies(page: Int, completion: @escaping (Result<TopMoviesEntity, Error>) -> Void)
}
