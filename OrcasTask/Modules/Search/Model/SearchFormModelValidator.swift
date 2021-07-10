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
        return cityName.count > 0
    }
}
