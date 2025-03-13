//
//  NetworkManager.swift
//  MIFood
//
//  Created by Илья Морозов on 12.03.2025.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    static let basicURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = basicURL + "appetizers"
    
    
    func getAppetizers(completion: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decodeResponse = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                completion(.success(decodeResponse.request))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        let cacheKey = urlString as NSString
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
            
        }
        
        task.resume()
    }
}
 
