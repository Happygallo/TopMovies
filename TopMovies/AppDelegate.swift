//
//  AppDelegate.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 25/07/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var movieListRouter = MovieListRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let movieListViewController = MovieListRouter.show()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: movieListViewController)
        window?.makeKeyAndVisible()
        
        return true
    }
}

