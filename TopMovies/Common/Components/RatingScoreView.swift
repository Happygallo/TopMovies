//
//  RatingScoreView.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 27/07/24.
//

import UIKit

class RatingScoreView: UIView {

    private let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            widthAnchor.constraint(equalToConstant: 60),
            heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureContent(rating: String, backgroundColor: UIColor, labelColor: UIColor) {
        numberLabel.text = rating
        numberLabel.textColor = labelColor
        self.backgroundColor = backgroundColor
    }
}
