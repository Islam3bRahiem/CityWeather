//
//  CashManager.swift
//  OrcasTask
//
//  Created by Islam  on 7/9/21.
//

import Foundation
import RxCocoa
import RxSwift

class CashManager {

    static var shared = CashManager()
    private let UD = UserDefaults.standard

//    private var items: BehaviorRelay<[ListResponse]> = .init(value: [])
//    var itemsObservable: Observable<[ListResponse]>

    init() {
//        itemsObservable = items.asObservable()
    }

    func fetchAllCity(completion: @escaping ([ResponseModel]) -> Void) {
        let data = UD.fetchAllCash()
        completion(data)
    }
    func save(_ data: ResponseModel) {
        UD.saveResponseToCash(response: data)
    }

    func fetchCity(cityName: String, completion: @escaping ([ListResponse]) -> Void) {
        let city = UD.fetchCityFromCash(cityName)
        completion(city?.list ?? [])
    }

}
