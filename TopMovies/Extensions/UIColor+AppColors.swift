//
//  UIColor+AppColors.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 27/07/24.
//

import UIKit

extension UIColor {
    static let color900 = UIColor(red: 0/255, green: 58/255, blue: 64/255, alpha: 1.0)
    static let color800 = UIColor(red: 51/255, green: 97/255, blue: 102/255, alpha: 1.0)
    static let color700 = UIColor(red: 102/255, green: 137/255, blue: 140/255, alpha: 1.0)
    static let color600 = UIColor(red: 128/255, green: 157/255, blue: 160/255, alpha: 1.0)
    static let color500 = UIColor(red: 153/255, green: 176/255, blue: 179/255, alpha: 1.0)
    static let color400 = UIColor(red: 179/255, green: 196/255, blue: 198/255, alpha: 1.0)
    static let color300 = UIColor(red: 204/255, green: 216/255, blue: 217/255, alpha: 1.0)
    static let color200 = UIColor(red: 230/255, green: 235/255, blue: 236/255, alpha: 1.0)
    static let color100 = UIColor(red: 243/255, green: 245/255, blue: 246/255, alpha: 1.0)
    static let color0 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    
    static let greenScore = UIColor(red: 0/255, green: 206/255, blue: 122/255, alpha: 1.0)
    static let yellowScore = UIColor(red: 255/255, green: 189/255, blue: 63/255, alpha: 1.0)
    static let redScore = UIColor(red: 255/255, green: 104/255, blue: 115/255, alpha: 1.0)
}

extension Date {
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
}
