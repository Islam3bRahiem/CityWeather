//
//  SearchFormModelValidator.swift
//  OrcasTask
//
//  Created by Islam  on 7/10/21.
//

import Foundation

protocol SearchModelValidatorProtocol {
      func isCityNameValid(cityName: String) -> Bool
}


class SearchFormModelValidator: SearchModelValidatorProtocol {

    func isCityNameValid(cityName: String) -> Bool {
//        var returnValue = true
//        if cityName.count < 1 {
//            returnValue = false
//        }
        return cityName.count > 0
    }
}
