//
//  APIEndpoint.swift
//  BaseProjectRepost
//
//  Created by Linh Vu on 10/12/24.
//

import Foundation
import Alamofire

protocol APIEndpoint {
    var baseUrl: String { get }
    var headers: HTTPHeaders { get }
    var encoding: ParameterEncoding { get }
    var timeout: TimeInterval { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var params: [String: Any] { get }
}

extension APIEndpoint {
    var baseUrl: String {
        return AppConstants.API.baseUrl
    }
    
    var headers: HTTPHeaders {
        return ["Content-Type": "application/json"]
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var timeout: TimeInterval {
        return AppConstants.API.timeout
    }
}
