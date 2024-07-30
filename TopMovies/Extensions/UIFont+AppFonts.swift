//
//  UIFont+AppFonts.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import UIKit

extension UIFont {
    enum CustomFontType: String {
        case regular = "SpaceMono-Regular"
        case bold = "SpaceMono-Bold"
        case italic = "SpaceMono-Italic"
        case boldItalic = "SpaceMono-BoldItalic"
    }
    
    static func spaceMonoFont(type: CustomFontType, size: CGFloat) -> UIFont? {
        return UIFont(name: type.rawValue, size: size)
    }
}
