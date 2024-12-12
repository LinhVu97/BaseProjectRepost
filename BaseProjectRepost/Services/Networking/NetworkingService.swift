//
//  NetworkingService.swift
//  BaseProjectRepost
//
//  Created by Linh Vu on 11/12/24.
//

import Foundation
import Alamofire

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .unknown:
            return "Unknown error"
        }
    }
}

class NetworkingService {
    static let shared = NetworkingService()
    
    private init() {}
    
    func request<T: Codable>(_ endpoint: APIEndpoint,
                             url: URL,
                             completion: @escaping (Result<T, APIError>) -> Void) {
        guard let fullURL = URL(string: "\(endpoint.baseUrl)\(endpoint.path)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(fullURL,
                   method: endpoint.method,
                   parameters: endpoint.params,
                   encoding: endpoint.encoding,
                   headers: endpoint.headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure:
                    completion(.failure(.invalidResponse))
                }
            }
        
        print(url)
        print(endpoint.headers)
        print(endpoint.params)
        print(endpoint.method)
    }
}
