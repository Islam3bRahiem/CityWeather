//
//  SearchRepository.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchRepository {
    func fetchSearchData(_ cityName: String) -> Observable<[ListResponse]>
}

class SearchRepositoryImpl: SearchRepository {
    let networkClient: NetworkClient

    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }

    func fetchSearchData(_ cityName: String) -> Observable<[ListResponse]> {
        Observable<[ListResponse]>.create { [weak self] (item) -> Disposable in
            self?.networkClient.performRequest(ResponseModel.self, router: SearchRouter.forecast(cityName)) { (result) in
                switch result {
                case .success(let data):
                    if data.cod == ResponseCode.Success.rawValue, let list = data.list {
                        item.onNext(list)
                        item.onCompleted()
                        self?.saveDataToDataBase(data)
                    } else {
                        item.onNext([])
                        item.onCompleted()
                    }
                case .failure(let error):
                    self?.fetchDataFromDatabase(item, for: cityName, error: error)
                }
            }
            return Disposables.create()
        }
    }


    //Private functions
    private func saveDataToDataBase(_ response: ResponseModel) {
        CashManager.shared.save(response)
    }
    private func fetchDataFromDatabase(_ item: AnyObserver<[ListResponse]>, for cityName: String, error: Error) {
        CashManager.shared.fetchCity(cityName: cityName) { [weak self](success, response) in
            guard self != nil else { return }
            if success {
                item.onNext(response ?? [])
                item.onCompleted()
            } else {
                item.onError(error)
            }
        }
    }

}
