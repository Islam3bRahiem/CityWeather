//
//  MockSearchWebService.swift
//  OrcasTaskTests
//
//  Created by Islam  on 7/10/21.
//

import Foundation
@testable import OrcasTask

protocol SearchWebServiceProtocol {
        func search(for cityName: String, completionHandler: @escaping (Bool?, SearchError?) -> Void)
}

class MockSearchWebService: SearchWebServiceProtocol {

    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false

    func search(for cityName: String, completionHandler: @escaping (Bool?, SearchError?) -> Void) {
        isSignupMethodCalled = true
        if shouldReturnError {
            completionHandler(false, SearchError.failedRequest(description: "Signup request was not successful"))
        } else {
            completionHandler(true, nil)
        }

    }

}
