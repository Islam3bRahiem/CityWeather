//
//  ResponseObject.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import Foundation

// MARK: - ResponseObject
struct ResponseObject<T: Decodable>: Decodable {
    let cod: String?
    let message: String?
    let cnt: Int?
    let list: T?
}
