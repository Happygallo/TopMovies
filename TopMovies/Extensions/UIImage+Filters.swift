//
//  UIImage+Filters.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 30/07/24.
//

import UIKit

extension UIImage {
    func applyMonochromeFilter(color: UIColor, intensity: Float) -> UIImage? {
        guard let cgImage = self.cgImage else { return nil }
        
        let ciImage = CIImage(cgImage: cgImage)
        
        if let monochromeFilter = CIFilter(name: "CIColorMonochrome") {
            monochromeFilter.setValue(ciImage, forKey: kCIInputImageKey)
            monochromeFilter.setValue(CIColor(color: color), forKey: kCIInputColorKey)
            monochromeFilter.setValue(intensity, forKey: kCIInputIntensityKey)
            
            if let outputImage = monochromeFilter.outputImage {
                let context = CIContext(options: nil)
                if let cgImageResult = context.createCGImage(outputImage, from: outputImage.extent) {
                    return UIImage(cgImage: cgImageResult)
                }
            }
        }
        
        return nil
    }
}
