//
//  MovieDetailRouter.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func show(movie: MovieEntity) -> UIViewController {
        let mapper = MovieDetailViewModelMapper()
        let imageLoaderService = ImageLoaderService()
        let view = MovieDetailViewController()
        let presenter = MovieDetailPresenter(mapper: mapper)
        let interactor = MovieDetailInteractor(movie: movie, imageLoaderService: imageLoaderService)
        let router = MovieDetailRouter()
        
        view.presenterInput = presenter
        presenter.router = router
        presenter.presenterOutput = view
        presenter.interactorInput = interactor
        interactor.interactorOutput = presenter
        router.viewController = view
        
        return view
    }
    
    func dismiss() {
        viewController?.dismiss(animated: true)
    }
}
