//
//  ResponseError.swift
//  OrcasTask
//
//  Created by Islam  on 7/9/21.
//

import Foundation

enum ResponseError: LocalizedError, Error {

    case invalidResponseModel
    case invalidCityName
    case failedRequest(error: Error)
    case noInternetConnection

//    var errorDescription: String? {
//        switch self {
//        case .failedRequest(let description):
//            return description
//        case .invalidResponseModel, .invalidCityName:
//            return "City Not Found"
//        }
//    }

}

enum ResponseCode: String {
    case Success = "200"
    case Error = "403"
}

