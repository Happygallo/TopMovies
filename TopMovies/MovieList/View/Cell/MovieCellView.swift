//
//  MovieCell.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 28/07/24.
//

import UIKit

class MovieCellView: UITableViewCell {

    let cardView: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .white
        card.layer.cornerRadius = 8
        card.layer.masksToBounds = false
        card.layer.shadowColor = UIColor.color900.cgColor
        card.layer.shadowOpacity = 0.5
        card.layer.shadowOffset = CGSize(width: 0, height: 2)
        card.layer.shadowRadius = 4
        return card
    }()

    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()

    let horizontalStack: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 8
        horizontalStack.alignment = .center
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        return horizontalStack
    }()

    let verticalStack: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.spacing = 0
        verticalStack.axis = .vertical
        verticalStack.alignment = .leading
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        return verticalStack
    }()

    let movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 21, weight: .bold)
        return label
    }()

    let yearLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .color600
        label.font = .spaceMonoFont(type: .regular, size: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let movieRating = RatingScoreView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildViewHierarchy() {
        contentView.addSubview(cardView)
        cardView.addSubview(movieImageView)
        cardView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(verticalStack)
        horizontalStack.addArrangedSubview(movieRating)
        verticalStack.addArrangedSubview(movieTitle)
        verticalStack.addArrangedSubview(yearLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            movieImageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 150),

            horizontalStack.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 16),
            horizontalStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            horizontalStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            horizontalStack.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8)
        ])
    }

    func configureContent(model: MovieListViewModel) {
        selectionStyle = .none
        backgroundColor = .color100
        
        yearLabel.text = model.year
        movieTitle.text = model.title
        movieImageView.image = model.coverImage
        movieRating.configureContent(rating: model.rating, backgroundColor: model.ratingColor, labelColor: model.ratingLabelColor)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isHighlighted: true, completion: nil)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isHighlighted: false, completion: nil)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isHighlighted: false, completion: nil)
    }

    private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)?) {
        let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
        let duration: TimeInterval = isHighlighted ? 0.2 : 0.4
        let transform: CGAffineTransform = isHighlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity

        UIView.animate(withDuration: duration, delay: 0, options: animationOptions, animations: {
            self.transform = transform
        }, completion: completion)
    }
}
