//
//  CityViewModel.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import Foundation

// MARK: - CityViewModel
class WeatherViewModel {
    var id: String
    var main: String
    var description: String
    var date: String

    init(_ item: ListResponse) {
        self.id = "#\(item.dt ?? 0)"
        self.main = item.weather?.first?.main ?? ""
        self.description = item.weather?.first?.weatherDescription ?? ""
        self.date = item.dtTxt ?? ""
    }
}
