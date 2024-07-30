//
//  MovieListViewController.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 27/07/24.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var presenterInput: MovieListPresenterInputProtocol?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.backgroundColor = .color100
        return table
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterInput?.fetchMovies()
        buildViewHierarchy()
        setupConstraints()
        configureNavigationBar()
    }
    
    private func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureNavigationBar() {
        title = "Top Movies"
        if let navigationController = navigationController {
            navigationController.navigationBar.prefersLargeTitles = true
            
            navigationController.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.color900,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .bold)
            ]
            
            navigationController.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.color900
            ]
        }
    }
}

extension MovieListViewController: MovieListPresenterOutputProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
    func reloadRow(index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenterInput?.movieTapped(index: indexPath.row)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenterInput?.numberOfMovies() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as? MovieCellView,
              let model = presenterInput?.movie(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        if model.coverImage == nil {
            presenterInput?.loadImage(index: indexPath.row)
        }
        
        cell.configureContent(model: model)
        
        if presenterInput?.isLastMovie(at: indexPath.row) ?? false {
            presenterInput?.fetchMovies()
        }
        
        return cell
    }
}
