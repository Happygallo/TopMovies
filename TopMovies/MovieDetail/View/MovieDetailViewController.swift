//
//  MoviesDetailViewController.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 25/07/24.
//

import UIKit

class MovieDetailViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.alwaysBounceVertical = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .color900.withAlphaComponent(0.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()
    
    private lazy var ratingScoreView = RatingScoreView()
    
    private lazy var posterAndTitleStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .top
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var movieTitle: MovieDetailTitle = MovieDetailTitle()
    
    private lazy var movieDescription = MovieDescriptionView()
    
    var presenterInput: MovieDetailPresenterInputProtocol?
    var backgroundImageHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        buildViewHierarchy()
        setupConstraints()
        presenterInput?.fetchMovie()
    }
    
    func buildViewHierarchy() {
        view.addSubview(scrollView)
        view.addSubview(closeButton)
        view.addSubview(ratingScoreView)
        scrollView.addSubview(backgroundImageView)
        scrollView.addSubview(roundedBackgroundView)
        scrollView.addSubview(contentView)
        backgroundImageView.addSubview(overlayView)
        contentView.addSubview(posterAndTitleStack)
        contentView.addSubview(movieDescription)
        
        posterAndTitleStack.addArrangedSubview(posterImageView)
        posterAndTitleStack.addArrangedSubview(movieTitle)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0),
            closeButton.widthAnchor.constraint(equalToConstant: 30.0),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor, multiplier: 1.0),
            closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0)
        ])
        
        NSLayoutConstraint.activate([
            ratingScoreView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            ratingScoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])
        
        backgroundImageHeightConstraint = backgroundImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageHeightConstraint
        ])
        
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -20),
            roundedBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            roundedBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            posterAndTitleStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterAndTitleStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterAndTitleStack.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor, constant: -32)
        ])

        NSLayoutConstraint.activate([
            posterImageView.widthAnchor.constraint(equalToConstant: 100),
            posterImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            movieDescription.topAnchor.constraint(equalTo: posterAndTitleStack.bottomAnchor, constant: 32),
            movieDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor)
        ])
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
}

extension MovieDetailViewController: MovieDetailPresenterOutputProtocol {
    func configureContent(model: MovieDetailViewModel) {
        let urlsToLoad = determineURLsToLoad(for: model)
        if !urlsToLoad.isEmpty {
            presenterInput?.loadImages(urls: urlsToLoad)
        }
        closeButton.setImage(UIImage(named: "lightOnDark")!, for: UIControl.State.normal)
        backgroundImageView.image = model.coverImage?.applyMonochromeFilter(color: .color500, intensity: 1.0)
        posterImageView.image = model.posterImage
        movieTitle.title = model.title
        
        movieTitle.year = model.date
        
        movieDescription.header = "Description"
        movieDescription.content = model.description
        ratingScoreView.configureContent(rating: model.rating, backgroundColor: model.ratingColor, labelColor: model.ratingLabelColor)
    }
    
    private func determineURLsToLoad(for model: MovieDetailViewModel) -> [URL] {
        var urlsToLoad = [URL]()
        if model.coverImage == nil {
            urlsToLoad.append(model.coverImageURL)
        }
        if model.posterImage == nil {
            urlsToLoad.append(model.posterImageURL)
        }
        return urlsToLoad
    }
}

extension MovieDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        backgroundImageHeightConstraint.constant = max(Constants.imageHeight - offsetY, .zero)
    }
}

private struct Constants {
    static let imageHeight: CGFloat = 250
}
