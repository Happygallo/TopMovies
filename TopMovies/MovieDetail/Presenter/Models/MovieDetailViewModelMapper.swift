//
//  MovieDetailViewModelMapper.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import UIKit

class MovieDetailViewModelMapper: MovieDetailViewModelMapperProtocol {
    func map(entity: MovieEntity) -> MovieDetailViewModel? {
        guard let coverImageURL = URL(string: "https://image.tmdb.org/t/p/w500" + entity.backdropPath),
              let posterImageURL = URL(string: "https://image.tmdb.org/t/p/w500" + entity.posterPath)
        else {
            return nil
        }
        let ratingColor = getColorForRating(entity.voteAverage)
        return MovieDetailViewModel(
            title: entity.title,
            date: entity.releaseDate.dateString,
            rating: String((entity.voteAverage * 10).rounded() / 10),
            coverImageURL: coverImageURL,
            posterImageURL: posterImageURL,
            description: entity.overview,
            ratingColor: ratingColor.background,
            ratingLabelColor: ratingColor.label
        )
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

protocol MovieDetailViewModelMapperProtocol {
    func map(entity: MovieEntity) -> MovieDetailViewModel?
}

