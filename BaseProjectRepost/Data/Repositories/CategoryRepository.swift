//
//  CategoryRepository.swift
//  BaseProjectRepost
//
//  Created by Linh Vu on 12/12/24.
//

import Foundation

protocol CategoryRepository {
    func fetchCategories(completion: @escaping (Result<[CategoryEntity], APIError>) -> Void)
}

class CategoryRepositoryImpl: CategoryRepository {

    func fetchCategories(completion: @escaping (Result<[CategoryEntity], APIError>) -> Void) {
        NetworkingService.shared.request(CategoryAPI(),
                                         responseType: CategoryResponse.self) { result in
            switch result {
            case .success(let data):
                let entities = data.drinks.map { DrinkMapper.mapToEntity(from: $0) }
                completion(.success(entities))
            case .failure:
                completion(.failure(.invalidResponse))
            }
        }
    }
}
