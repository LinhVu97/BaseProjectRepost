//
//  GetUserUseCase.swift
//  BaseProjectRepost
//
//  Created by Linh Vu on 12/12/24.
//

import Foundation

class GetCategoryUseCase {
    private let categoryRepository: CategoryRepository
    
    init(categoryRepository: CategoryRepository) {
        self.categoryRepository = categoryRepository
    }
    
    func execute(completion: @escaping (Result<[CategoryEntity], APIError>) -> Void) {
        categoryRepository.fetchCategories(completion: completion)
    }
}
