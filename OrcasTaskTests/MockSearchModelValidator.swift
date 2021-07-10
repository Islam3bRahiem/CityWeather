//
//  MockSearchModelValidator.swift
//  OrcasTaskTests
//
//  Created by Islam  on 7/10/21.
//

import Foundation
@testable import OrcasTask


class MockSearchModelValidator: SearchModelValidatorProtocol {

    var isCityNameValidated: Bool = false

    func isCityNameValid(cityName: String) -> Bool {
        isCityNameValidated = true
        return isCityNameValidated
    }
}
