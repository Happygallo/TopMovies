//
//  ImageLoaderService.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 29/07/24.
//

import Foundation

class ImageLoaderService: ImageLoaderServiceProtocol {
    private let urlSession: URLSession
    private let imageCache: NSCache<NSURL, NSData>
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        self.imageCache = NSCache<NSURL, NSData>()
    }
    
    func loadImage(from url: URL, completion: @escaping (Data?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url as NSURL) {
            completion(Data(referencing: cachedImage))
        } else {
            DispatchQueue.global(qos: .background).async {
                self.fetchImageFromNetwork(from: url) { [weak self] data in
                    if let data {
                        self?.imageCache.setObject(data as NSData, forKey: url as NSURL)
                        completion(data)
                    } else {
                        completion(nil)
                    }
                }
            }
        }
    }
    
    func loadImages(from urls: [URL], completion: @escaping ([URL: Data]) -> Void) {
        let group = DispatchGroup()
        var loadedImages = [URL: Data]()
        
        for url in urls {
            group.enter()
            loadImage(from: url) { data in
                if let data = data {
                    loadedImages[url] = data
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            completion(loadedImages)
        }
    }
    
    private func fetchImageFromNetwork(from url: URL, completion: @escaping (Data?) -> Void) {
        let task = urlSession.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
    }
}
