//
//  CategoryDataSource.swift
//  BaseProjectRepost
//
//  Created by Linh Vu on 12/12/24.
//

import Foundation

class DrinkMapper {
    static func mapToEntity(from model: CategoryModel) -> CategoryEntity {
        return CategoryEntity(category: model.strCategory)
    }
}
