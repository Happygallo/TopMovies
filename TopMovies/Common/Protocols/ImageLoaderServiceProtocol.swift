//
//  ImageLoaderServiceProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import Foundation

protocol ImageLoaderServiceProtocol: AnyObject {
    func loadImage(from url: URL, completion: @escaping (Data?) -> Void)
    func loadImages(from urls: [URL], completion: @escaping ([URL: Data]) -> Void)
}
