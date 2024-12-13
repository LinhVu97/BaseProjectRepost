//
//  CategoryAPI.swift
//  BaseProjectRepost
//
//  Created by Linh Vu on 12/12/24.
//

import Foundation
import Alamofire

struct CategoryAPI: APIEndpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var params: [String: Any] {
        return [:]
    }
    
    var path: String {
         return "json/v1/1/list.php?c=list"
    }
}
