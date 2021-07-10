//
//  SearchWebServiceTests.swift
//  OrcasTaskTests
//
//  Created by Islam  on 7/10/21.
//

import XCTest
import RxSwift
import RxCocoa
@testable import OrcasTask

class SearchWebServiceTests: XCTestCase {

    var disposeBag: DisposeBag!
    var searchRepositoryImpl: SearchRepositoryImpl!
    var searchUseCase: SearchUseCase!
    var sut: SearchViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        searchRepositoryImpl = SearchRepositoryImpl()
        searchUseCase = SearchUseCase(searchRepository: searchRepositoryImpl)
        sut = SearchViewModel(searchUseCase: searchUseCase)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        searchRepositoryImpl = nil
        searchUseCase = nil
        disposeBag = nil
    }

    func testSearchResponseModelWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {

        // Arrange
        let successString = "{\"cod\":\"\(ResponseCode.Success.rawValue)\"}"
        MockURLProtocol.stubResponseData =  successString.data(using: .utf8)

        //Act
        searchUseCase.executeCitiesFetch("Cairo").subscribe { (response) in
            // Assert
            XCTAssertEqual(response.element?.cod, ResponseCode.Success.rawValue)
        }.disposed(by: disposeBag)
    }

    func testSearchResponseModelWebService_WhenGivenFailWithNoResponseList_ReturnsSuccess() {

        // Arrange
        let successString = "{\"cod\":\"\(ResponseCode.Error.rawValue)\"}"
        MockURLProtocol.stubResponseData =  successString.data(using: .utf8)

        //Act
        searchUseCase.executeCitiesFetch("Cairo").subscribe { (response) in
            // Assert
            XCTAssertEqual(response.element?.cod, ResponseCode.Success.rawValue)
        }.disposed(by: disposeBag)
    }


}
