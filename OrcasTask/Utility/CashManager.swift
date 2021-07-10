//
//  CashManager.swift
//  OrcasTask
//
//  Created by Islam  on 7/9/21.
//

import Foundation
import RxCocoa
import RxSwift

protocol CashManagerOperation {
    func fetchAllCity(completion: @escaping ([ResponseModel]) -> Void)
    func save(_ data: ResponseModel)
    func fetchCity(cityName: String, completion: @escaping (Bool, ResponseModel?) -> Void) 
}

class CashManager: CashManagerOperation {

    static var shared = CashManager()
    private let UD = UserDefaults.standard

    init() { }

    func fetchAllCity(completion: @escaping ([ResponseModel]) -> Void) {
        let data = UD.fetchAllCash()
        completion(data)
    }
    func save(_ data: ResponseModel) {
        UD.saveResponseToCash(response: data)
    }

    func fetchCity(cityName: String, completion: @escaping (Bool, ResponseModel?) -> Void) {
        if let model = UD.fetchCityFromCash(cityName) {
            completion(true, model)
            return
        }
        completion(false, nil)
    }

}
