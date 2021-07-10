//
//  Constans.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}


class NetworkConstants {
    static let baseUrl = "https://api.openweathermap.org/data/2.5/"
    static let appid = "5e4621edb49aac20f060e7c6fa7cf6d1"
}

enum ResponseError: Error {
    case URLNotValid
    case CityNotFound
    case DecoderError

}

