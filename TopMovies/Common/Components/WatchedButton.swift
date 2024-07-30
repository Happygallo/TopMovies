//
//  WatchedButton.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 30/07/24.
//

import UIKit

class WatchedButton: UIButton {
    
    private let firstIconImageView = UIImageView()
    private let secondIconImageView = UIImageView()
    private var isFirstState: Bool = true
    var iconPosition: NSLayoutConstraint?
    var firstStateIcon: UIImage? {
        didSet {
            firstIconImageView.image = firstStateIcon?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    var secondStateIcon: UIImage? {
        didSet {
            secondIconImageView.image = secondStateIcon?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    var firstTitle: String = "" {
        didSet {
            setTitle(firstTitle, for: .normal)
        }
    }
    
    var secondTitle: String = "" {
        didSet {
            if !isFirstState {
                setTitle(secondTitle, for: .normal)
            }
        }
    }
    
    var firstBackgroundColor: UIColor = .color900 {
        didSet {
            backgroundColor = firstBackgroundColor
        }
    }
    
    var secondBackgroundColor: UIColor = .red {
        didSet {
            if !isFirstState {
                backgroundColor = secondBackgroundColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setTitleColor(.color0, for: .normal)
        layer.cornerRadius = 20
        
        firstIconImageView.contentMode = .scaleAspectFit
        firstIconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(firstIconImageView)
        
        secondIconImageView.contentMode = .scaleAspectFit
        secondIconImageView.translatesAutoresizingMaskIntoConstraints = false
        secondIconImageView.alpha = 0
        addSubview(secondIconImageView)
        
        iconPosition = firstIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        NSLayoutConstraint.activate([
            iconPosition!,
            firstIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            firstIconImageView.widthAnchor.constraint(equalToConstant: 28),
            firstIconImageView.heightAnchor.constraint(equalToConstant: 28),
            
            secondIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            secondIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            secondIconImageView.widthAnchor.constraint(equalToConstant: 28),
            secondIconImageView.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        addTarget(self, action: #selector(toggleState), for: .touchUpInside)
        updateViewForCurrentState()
    }
    
    @objc private func toggleState() {
        isFirstState.toggle()
        updateViewForCurrentState()
    }
    
    private func updateViewForCurrentState() {
        UIView.animate(withDuration: 0.3) {
            self.firstIconImageView.alpha = self.isFirstState ? 1 : 0
            self.secondIconImageView.alpha = self.isFirstState ? 0 : 1
            self.setTitle(self.isFirstState ? self.firstTitle : self.secondTitle, for: .normal)
            self.backgroundColor = self.isFirstState ? self.firstBackgroundColor : self.secondBackgroundColor
            self.iconPosition = self.firstIconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        }
    }
}
