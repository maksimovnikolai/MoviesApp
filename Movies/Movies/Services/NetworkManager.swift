//
//  NetworkManager.swift
//  Movies
//
//  Created by Nikolai Maksimov on 30.01.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

protocol NetworkManagerProtocol {
    func getTrendingMovies(completion: @escaping (Result<[Title], NetworkError>) -> Void)
    func getTrendingTVs(completion: @escaping (Result<[Title], NetworkError>) -> Void)
    func getUpcomingMovies(completion: @escaping (Result<[Title], NetworkError>) -> Void)
    func getPopular(completion: @escaping (Result<[Title], NetworkError>) -> Void)
    func getTopRated(completion: @escaping (Result<[Title], NetworkError>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    private let decoder = JSONDecoder()
    
    // MARK: Fetch Trending Movies
    func getTrendingMovies(completion: @escaping (Result<[Title], NetworkError>) -> Void) {
        guard let url = URL(string: Constants.trendingMovie.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            do {
                let results = try self.decoder.decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }
        task.resume()
    }
    
    // MARK: Fetch Trending TVs
    func getTrendingTVs(completion: @escaping (Result<[Title], NetworkError>) -> Void) {
        
        guard let url = URL(string: Constants.trendingTv.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
    
    // MARK: Fetch Upcoming Movies
    func getUpcomingMovies(completion: @escaping (Result<[Title], NetworkError>) -> Void) {
        guard let url = URL(string: Constants.upcomingMovie.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
    
    // MARK: Fetch Popular Movies
    func getPopular(completion: @escaping (Result<[Title], NetworkError>) -> Void) {
        guard let url = URL(string: Constants.popularMovie.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
        
    }
    
    // MARK: Fetch Top Movies
    func getTopRated(completion: @escaping (Result<[Title], NetworkError>) -> Void) {
        guard let url = URL(string: Constants.ratedMovie.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
