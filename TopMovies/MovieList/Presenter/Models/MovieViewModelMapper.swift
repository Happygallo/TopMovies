//
//  MovieViewModelMapper.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import UIKit

class MovieViewModelMapper: MovieViewModelMapperProtocol {
    func map(entities: [MovieEntity]) -> [MovieListViewModel] {
        let movies: [MovieListViewModel] = entities.compactMap {
            guard let coverImageURL = URL(string: "https://image.tmdb.org/t/p/w500" + $0.backdropPath) else {
                return nil
            }
            let ratingColor = getColorForRating($0.voteAverage)
            return MovieListViewModel(
                id: $0.id,
                title: $0.title,
                year: $0.releaseDate.dateString,
                rating: String(($0.voteAverage * 10).rounded() / 10),
                coverImageURL: coverImageURL,
                ratingColor: ratingColor.background,
                ratingLabelColor: ratingColor.label
            )
        }
        return movies
    }
    
    private func getColorForRating(_ rating: Double) -> (label: UIColor, background: UIColor) {
        switch rating {
        case 0..<4.0:
            return (label: .color0 , background: .redScore)
        case 4.0...6.0:
            return (label: .color900, background: .yellowScore)
        default:
            return (label: .color900 , background: .greenScore)
        }
    }
}
