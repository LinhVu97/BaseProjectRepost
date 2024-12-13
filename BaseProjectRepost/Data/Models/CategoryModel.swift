//
//  ExampleModel.swift
//  BaseProjectRepost
//
//  Created by Linh Vu on 12/12/24.
//

import Foundation

struct CategoryModel: Codable {
    var strCategory: String
}

struct CategoryResponse: Codable {
    var drinks: [CategoryModel]
}
