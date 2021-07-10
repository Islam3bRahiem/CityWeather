//
//  SearchUseCase.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import Foundation
import RxSwift
import RxCocoa

class SearchUseCase {

    let searchRepository: SearchRepository
    let disposeBag = DisposeBag()

    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }

    func executeCitiesFetch(_ cityName: String) -> Observable<ResponseModel>{
        let observable = searchRepository.fetchSearchData(cityName)
        observable.subscribe { (item) in
            // TODO :- nothing
        }.disposed(by: disposeBag)
        return observable
    }

}
