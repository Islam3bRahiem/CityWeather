//
//  SearchViewControllerTests.swift
//  OrcasTaskTests
//
//  Created by Islam  on 7/10/21.
//

import XCTest
@testable import OrcasTask

class SearchViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SearchVC!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SearchVC") as SearchVC
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchViewController_WhenCreated_HasRequiredSearchTextFiledEmpty() throws {

        // Arrange
        let searchTxf = try XCTUnwrap(sut.searchTxf, "The searchTxf is not connected to an IBOutlet")

        // Assert
        XCTAssertEqual(searchTxf.text, "", "First Search text field was not empty when the view controller initially loaded")
    }

    func testSearchViewController_WhenCreated_HasSearchButtonAndAction() throws {
        // Arrange
        let searchButton: UIButton = try XCTUnwrap(sut.searchBtn, "Search button does not have a referencing outlet")

        // Act
        let searchButtonActions = try XCTUnwrap(searchButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Search button does not have any actions assigned to it")

        // Assert
        XCTAssertEqual(searchButtonActions.count, 1)
        XCTAssertEqual(searchButtonActions.first, "searchBtnClicked:", "There is no action with a name searchBtnClicked assigned to search button")
    }

    

}
