//
//  SearchFormModelValidatorTests.swift
//  OrcasTaskTests
//
//  Created by Islam  on 7/10/21.
//

import XCTest
@testable import OrcasTask

class SearchFormModelValidatorTests: XCTestCase {

    var sut: SearchFormModelValidator!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SearchFormModelValidator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    // MARK: City Name Validation Unit Tests
    func testSearchFormModelValidator_WhenValidCityNameProvided_ShouldReturnTrue() {

        // Arrange
        // Act
        let isCityNameValid = sut.isCityNameValid(cityName: "Cairo")

        // Assert
        XCTAssertTrue(isCityNameValid, "The isCityNameValid() should have returned TRUE for a valid city name but returned FALSE")
    }

    func testSearchFormModelValidator_WhenTooShortCityNameProvided_ShouldReturnFalse() {

        // Arrange
        // Act
        let isCityNameValid = sut.isCityNameValid(cityName: "")

        // Assert
        XCTAssertFalse(isCityNameValid, "The isCityNameValid() should have returned FALSE for a city name that is shorter than 1 characters but it has returned TRUE")

    }
}
