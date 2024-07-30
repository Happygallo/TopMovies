//
//  MovieListRouter.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 27/07/24.
//

import UIKit

class MovieListRouter: MovieListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func show() -> UIViewController {
        let mapper = MovieViewModelMapper()
        let apiDataManager = MovieListApiDataManager()
        let imageLoaderService = ImageLoaderService()
        let view = MovieListViewController()
        let presenter = MovieListPresenter(mapper: mapper)
        let interactor = MovieListInteractor(apiDataManager: apiDataManager, imageLoaderService: imageLoaderService)
        let router = MovieListRouter()
        
        view.presenterInput = presenter
        presenter.router = router
        presenter.presenterOutput = view
        presenter.interactorInput = interactor
        interactor.interactorOutput = presenter
        router.viewController = view
        
        return view
    }
    
    func navigateToDetail(movie: MovieEntity) {
        let detailViewController = MovieDetailRouter.show(movie: movie)
        viewController?.present(detailViewController, animated: true)
    }
}
