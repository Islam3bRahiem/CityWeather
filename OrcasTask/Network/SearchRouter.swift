//
//  SearchRouter.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import Foundation
import Alamofire

enum SearchRouter: APIRouter {
    case forecast(String)
    
    var method: HTTPMethod {
        switch self {
        case .forecast:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .forecast:
            return "forecast"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .forecast(let city):
            let parameters = [
                "q": city,
                "appid": NetworkConstants.appid
            ]
            return parameters
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .forecast:
            return URLEncoding.default
        }
    }


}
