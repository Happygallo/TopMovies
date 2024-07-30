//
//  MovieViewModelMapperProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import Foundation

protocol MovieViewModelMapperProtocol {
    func map(entities: [MovieEntity]) -> [MovieListViewModel]
}
