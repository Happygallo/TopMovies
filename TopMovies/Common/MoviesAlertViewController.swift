//
//  MoviesAlertViewController.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 30/07/24.
//

import UIKit

class MoviesAlertViewController: UIViewController {
    
    private let confirmAction: (() -> Void)?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .color900
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .color600
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(.color0, for: .normal)
        button.backgroundColor = .color900
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(title: String, message: String, confirmAction: (() -> Void)?) {
        self.confirmAction = confirmAction
        super.init(nibName: nil, bundle: nil)
        configureContent(title: title, message: message)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func configureContent(title: String, message: String) {
        titleLabel.text = title
        messageLabel.text = message
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.color900.withAlphaComponent(0.6)
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(confirmButton)
        
        setupConstraints()
    }
    
    @objc private func confirmButtonTapped() {
        dismiss(animated: true, completion: confirmAction)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            confirmButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 24),
            confirmButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            confirmButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            confirmButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            confirmButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
