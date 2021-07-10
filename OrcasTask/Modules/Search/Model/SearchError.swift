//
//  SearchError.swift
//  OrcasTask
//
//  Created by Islam  on 7/10/21.
//

import Foundation

enum SearchError: LocalizedError, Equatable {

    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)

    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }

}

