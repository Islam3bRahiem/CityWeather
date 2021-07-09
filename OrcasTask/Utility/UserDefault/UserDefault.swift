//
//  UserDefault.swift
//  OrcasTask
//
//  Created by Islam  on 7/9/21.
//

import Foundation

extension UserDefaults {
    func fetchAllCash() -> [ResponseModel] {
        if let def = UserDefaults.standard.data(forKey: "CASH_DATA") {
            let data = try! JSONDecoder().decode([ResponseModel].self, from: def)
            return data
        }
        return []
    }
    func saveResponseToCash(response: ResponseModel) {
        var array = fetchAllCash()
        if let index = array.firstIndex(where: {$0.city?.name == response.city?.name}) {
            array.insert(response, at: index)
        } else {
            array.append(response)
        }
        let data = try! JSONEncoder().encode(array)
        UserDefaults.standard.set(data, forKey: "CASH_DATA")
    }
    func fetchCityFromCash(_ cityName: String) -> ResponseModel? {
        let array = fetchAllCash()
        if let item = array.first(where: {$0.city?.name == cityName }) {
            return item
        }
        return nil
    }
}
