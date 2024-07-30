//
//  APIDataManager.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 28/07/24.
//

import Foundation

import Foundation

enum APIDataManagerError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
}

class MovieListApiDataManager: MovieListApiDataManagerProtocol {
    
    private let baseURL: String
    private let apiKey: String
    private let urlSession: URLSession
    
    init(
        baseURL: String = "https://api.themoviedb.org/3",
        apiKey: String = "64e2974cebd0e95977481bc085c4ef1d",
        urlSession: URLSession = .shared
    ) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.urlSession = urlSession
    }
    
    func fetchTopMovies(page: Int, completion: @escaping (Result<TopMoviesEntity, Error>) -> Void) {
        guard let url = makeURL(endpoint: "/movie/popular", queryItems: ["api_key": apiKey, "page": "\(page)"]) else {
            completion(.failure(APIDataManagerError.invalidURL))
            return
        }
        
        performRequest(url: url, completion: completion)
    }
    
    private func makeURL(endpoint: String, queryItems: [String: String]) -> URL? {
        var components = URLComponents(string: baseURL + endpoint)
        components?.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components?.url
    }
    
    private func performRequest<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIDataManagerError.noData))
                return
            }
            
            do {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let decodedResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(APIDataManagerError.decodingError(error)))
            }
        }
        task.resume()
    }
}
