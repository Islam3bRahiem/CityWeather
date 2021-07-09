//
//  SearchViewModel.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchViewModelInput {
    func searchForCity(with cityName: String?)
}

protocol SearchViewModelOutput {
    var numberOfItems: Int { get }
}

class SearchViewModel: BaseViewModel, SearchViewModelInput, SearchViewModelOutput {

    var cities: BehaviorRelay<[CityViewModel]> = .init(value: [])
    private let disposeBag = DisposeBag()
    private let searchUseCase: SearchUseCase


    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
    }


    // Inputs
    func searchForCity(with cityName: String?) {
        guard let cityName = cityName, !cityName.isEmpty else {
            self.displayToastMessage.onNext("Enter city name")
            return
        }
        isLoading.onNext(true)
        searchUseCase.executeCitiesFetch(cityName).subscribe { [unowned self] (response) in
            self.isLoading.onNext(false)
            self.cities.accept(response.map(CityViewModel.init))
            if response.isEmpty {
                self.displayToastMessage.onNext("City Not found")
            }
        } onError: { (error) in
            self.isLoading.onNext(false)
            self.noInternetConnection.onNext("")
        } onCompleted: {
            self.isLoading.onNext(false)
        }.disposed(by: disposeBag)

    }

    // outputs
    var numberOfItems: Int {
        return cities.value.count
    }
    
}
